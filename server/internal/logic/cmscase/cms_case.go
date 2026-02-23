package cmscase

import (
	"context"
	"time"

	"github.com/gogf/gf/v2/errors/gerror"

	"xygo/internal/consts"
	"xygo/internal/dao"
	"xygo/internal/model"
	"xygo/internal/model/do"
	"xygo/internal/model/entity"
	"xygo/internal/model/input/adminin"
	"xygo/internal/model/input/form"
	"xygo/internal/service"
)

type sCmsCase struct{}

func init() {
	service.RegisterCmsCase(&sCmsCase{})
}

// ==================== 案例分类 ====================

// CategoryList 案例分类列表（树形）
func (s *sCmsCase) CategoryList(ctx context.Context, in *adminin.CaseCategoryListInp) (*adminin.CaseCategoryListModel, error) {
	m := dao.CmsCaseCategory.Ctx(ctx)

	if in.Title != "" {
		m = m.WhereLike("title", "%"+in.Title+"%")
	}
	if in.Status >= 0 {
		m = m.Where("status", in.Status)
	}

	var list []entity.CmsCaseCategory
	err := m.OrderDesc("sort").OrderAsc("id").Scan(&list)
	if err != nil {
		return nil, err
	}

	nodes := make([]*adminin.CaseCategoryListItem, 0, len(list))
	for _, it := range list {
		nodes = append(nodes, &adminin.CaseCategoryListItem{
			Id:        it.Id,
			Pid:       it.Pid,
			Title:     it.Title,
			Icon:      it.Icon,
			Sort:      it.Sort,
			Status:    it.Status,
			Remark:    it.Remark,
			CreatedAt: it.CreatedAt,
			UpdatedAt: it.UpdatedAt,
		})
	}

	tree := model.BuildTree(
		nodes,
		func(n *adminin.CaseCategoryListItem) uint { return uint(n.Id) },
		func(n *adminin.CaseCategoryListItem) uint { return uint(n.Pid) },
		func(n *adminin.CaseCategoryListItem, children []*adminin.CaseCategoryListItem) {
			n.Children = children
		},
	)

	roots := make([]*adminin.CaseCategoryListItem, 0, len(tree))
	for _, n := range tree {
		if n != nil {
			roots = append(roots, n)
		}
	}

	return &adminin.CaseCategoryListModel{List: roots}, nil
}

// CategorySave 新增/编辑案例分类
func (s *sCmsCase) CategorySave(ctx context.Context, in *adminin.CaseCategorySaveInp) (uint64, error) {
	now := uint64(time.Now().Unix())

	if in.Id > 0 {
		_, err := dao.CmsCaseCategory.Ctx(ctx).Where("id", in.Id).Data(do.CmsCaseCategory{
			Pid:       in.Pid,
			Title:     in.Title,
			Icon:      in.Icon,
			Sort:      in.Sort,
			Status:    in.Status,
			Remark:    in.Remark,
			UpdatedAt: now,
		}).Update()
		if err != nil {
			return 0, err
		}
		return in.Id, nil
	}

	result, err := dao.CmsCaseCategory.Ctx(ctx).Data(do.CmsCaseCategory{
		Pid:       in.Pid,
		Title:     in.Title,
		Icon:      in.Icon,
		Sort:      in.Sort,
		Status:    in.Status,
		Remark:    in.Remark,
		CreatedAt: now,
		UpdatedAt: now,
	}).Insert()
	if err != nil {
		return 0, err
	}
	id, _ := result.LastInsertId()
	return uint64(id), nil
}

// CategoryDelete 删除案例分类
func (s *sCmsCase) CategoryDelete(ctx context.Context, id uint64) error {
	childCount, err := dao.CmsCaseCategory.Ctx(ctx).Where("pid", id).Count()
	if err != nil {
		return err
	}
	if childCount > 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "该分类下还有子分类，无法删除")
	}

	caseCount, err := dao.CmsCase.Ctx(ctx).Where("category_id", id).Where("deleted_at", 0).Count()
	if err != nil {
		return err
	}
	if caseCount > 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "该分类下还有案例，无法删除")
	}

	_, err = dao.CmsCaseCategory.Ctx(ctx).Where("id", id).Delete()
	return err
}

// ==================== 案例内容 ====================

// List 案例列表（分页）
func (s *sCmsCase) List(ctx context.Context, in *adminin.CaseListInp) (*adminin.CaseListModel, error) {
	m := dao.CmsCase.Ctx(ctx).Where("deleted_at", 0)

	if in.CategoryId > 0 {
		m = m.Where("category_id", in.CategoryId)
	}
	if in.Title != "" {
		m = m.WhereLike("title", "%"+in.Title+"%")
	}
	if in.Status >= 0 {
		m = m.Where("status", in.Status)
	}

	count, err := m.Count()
	if err != nil {
		return nil, err
	}

	page, size := in.Page, in.PageSize
	if page <= 0 {
		page = 1
	}
	if size <= 0 {
		size = 20
	}

	var list []entity.CmsCase
	if count > 0 {
		err = m.Page(page, size).OrderDesc("is_top").OrderDesc("sort").OrderDesc("id").Scan(&list)
		if err != nil {
			return nil, err
		}
	}

	categoryMap := s.getCategoryMap(ctx)

	items := make([]adminin.CaseListItem, 0, len(list))
	for _, it := range list {
		items = append(items, adminin.CaseListItem{
			Id:           it.Id,
			CategoryId:   it.CategoryId,
			CategoryName: categoryMap[it.CategoryId],
			Title:        it.Title,
			Cover:        it.Cover,
			Summary:      it.Summary,
			Link:         it.Link,
			Views:        it.Views,
			Sort:         it.Sort,
			Status:       it.Status,
			IsTop:        it.IsTop,
			Tags:         it.Tags,
			CreatedBy:    it.CreatedBy,
			CreatedAt:    it.CreatedAt,
			UpdatedAt:    it.UpdatedAt,
		})
	}

	return &adminin.CaseListModel{
		List: items,
		PageRes: form.PageRes{
			Page: page, PageSize: size, Total: count,
		},
	}, nil
}

// Detail 案例详情
func (s *sCmsCase) Detail(ctx context.Context, id uint64) (*adminin.CaseDetailModel, error) {
	var c entity.CmsCase
	err := dao.CmsCase.Ctx(ctx).Where("id", id).Where("deleted_at", 0).Scan(&c)
	if err != nil {
		return nil, err
	}
	if c.Id == 0 {
		return nil, gerror.NewCode(consts.CodeInvalidParam, "案例不存在")
	}
	return s.entityToDetail(ctx, &c), nil
}

// SiteDetail 前台案例详情（浏览量+1）
func (s *sCmsCase) SiteDetail(ctx context.Context, id uint64) (*adminin.CaseDetailModel, error) {
	var c entity.CmsCase
	err := dao.CmsCase.Ctx(ctx).Where("id", id).Where("deleted_at", 0).Where("status", 1).Scan(&c)
	if err != nil {
		return nil, err
	}
	if c.Id == 0 {
		return nil, gerror.NewCode(consts.CodeInvalidParam, "案例不存在")
	}

	_, _ = dao.CmsCase.Ctx(ctx).Where("id", c.Id).Increment("views", 1)

	return s.entityToDetail(ctx, &c), nil
}

// Save 新增/编辑案例
func (s *sCmsCase) Save(ctx context.Context, in *adminin.CaseSaveInp, operatorId uint64) (uint64, error) {
	now := uint64(time.Now().Unix())

	if in.Id > 0 {
		_, err := dao.CmsCase.Ctx(ctx).Where("id", in.Id).Data(do.CmsCase{
			CategoryId: in.CategoryId,
			Title:      in.Title,
			Cover:      in.Cover,
			Summary:    in.Summary,
			Content:    in.Content,
			Link:       in.Link,
			Sort:       in.Sort,
			Status:     in.Status,
			IsTop:      in.IsTop,
			Tags:       in.Tags,
			UpdatedBy:  operatorId,
			UpdatedAt:  now,
		}).Update()
		if err != nil {
			return 0, err
		}
		return in.Id, nil
	}

	result, err := dao.CmsCase.Ctx(ctx).Data(do.CmsCase{
		CategoryId: in.CategoryId,
		Title:      in.Title,
		Cover:      in.Cover,
		Summary:    in.Summary,
		Content:    in.Content,
		Link:       in.Link,
		Sort:       in.Sort,
		Status:     in.Status,
		IsTop:      in.IsTop,
		Tags:       in.Tags,
		CreatedBy:  operatorId,
		UpdatedBy:  operatorId,
		CreatedAt:  now,
		UpdatedAt:  now,
	}).Insert()
	if err != nil {
		return 0, err
	}
	id, _ := result.LastInsertId()
	return uint64(id), nil
}

// Delete 删除案例（软删除）
func (s *sCmsCase) Delete(ctx context.Context, id uint64) error {
	now := uint64(time.Now().Unix())
	_, err := dao.CmsCase.Ctx(ctx).Where("id", id).Data(do.CmsCase{
		DeletedAt: now,
	}).Update()
	return err
}

// ==================== 内部辅助方法 ====================

func (s *sCmsCase) getCategoryMap(ctx context.Context) map[uint64]string {
	var categories []entity.CmsCaseCategory
	_ = dao.CmsCaseCategory.Ctx(ctx).Scan(&categories)
	m := make(map[uint64]string, len(categories))
	for _, c := range categories {
		m[c.Id] = c.Title
	}
	return m
}

func (s *sCmsCase) entityToDetail(ctx context.Context, c *entity.CmsCase) *adminin.CaseDetailModel {
	categoryMap := s.getCategoryMap(ctx)
	return &adminin.CaseDetailModel{
		Id:           c.Id,
		CategoryId:   c.CategoryId,
		CategoryName: categoryMap[c.CategoryId],
		Title:        c.Title,
		Cover:        c.Cover,
		Summary:      c.Summary,
		Content:      c.Content,
		Link:         c.Link,
		Views:        c.Views,
		Sort:         c.Sort,
		Status:       c.Status,
		IsTop:        c.IsTop,
		Tags:         c.Tags,
		CreatedBy:    c.CreatedBy,
		UpdatedBy:    c.UpdatedBy,
		CreatedAt:    c.CreatedAt,
		UpdatedAt:    c.UpdatedAt,
	}
}
