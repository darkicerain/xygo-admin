package community

import (
	"context"
	"encoding/json"
	"strings"
	"time"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/consts"
	"xygo/internal/dao"
	"xygo/internal/model/do"
	"xygo/internal/model/entity"
	"xygo/internal/model/input/adminin"
	"xygo/internal/model/input/form"
	"xygo/internal/service"
)

type sCommunity struct{}

func init() {
	service.RegisterCommunity(&sCommunity{})
}

// ==================== 分类 ====================

func (s *sCommunity) CategoryList(ctx context.Context, in *adminin.CommunityCategoryListInp) (*adminin.CommunityCategoryListModel, error) {
	m := dao.CommunityCategory.Ctx(ctx)
	if in.Status >= 0 {
		m = m.Where("status", in.Status)
	}
	var list []entity.CommunityCategory
	err := m.OrderDesc("sort").OrderAsc("id").Scan(&list)
	if err != nil {
		return nil, err
	}
	items := make([]adminin.CommunityCategoryItem, 0, len(list))
	for _, it := range list {
		items = append(items, adminin.CommunityCategoryItem{
			Id: it.Id, Title: it.Title, Icon: it.Icon,
			Sort: it.Sort, Status: it.Status,
			CreatedAt: it.CreatedAt, UpdatedAt: it.UpdatedAt,
		})
	}
	return &adminin.CommunityCategoryListModel{List: items}, nil
}

func (s *sCommunity) CategorySave(ctx context.Context, in *adminin.CommunityCategorySaveInp) (uint64, error) {
	now := uint64(time.Now().Unix())
	if in.Id > 0 {
		_, err := dao.CommunityCategory.Ctx(ctx).Where("id", in.Id).Data(do.CommunityCategory{
			Title: in.Title, Icon: in.Icon, Sort: in.Sort, Status: in.Status, UpdatedAt: now,
		}).Update()
		return in.Id, err
	}
	result, err := dao.CommunityCategory.Ctx(ctx).Data(do.CommunityCategory{
		Title: in.Title, Icon: in.Icon, Sort: in.Sort, Status: in.Status,
		CreatedAt: now, UpdatedAt: now,
	}).Insert()
	if err != nil {
		return 0, err
	}
	id, _ := result.LastInsertId()
	return uint64(id), nil
}

func (s *sCommunity) CategoryDelete(ctx context.Context, id uint64) error {
	count, err := dao.CommunityPost.Ctx(ctx).Where("category_id", id).Where("deleted_at", 0).Count()
	if err != nil {
		return err
	}
	if count > 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "该分类下还有帖子，无法删除")
	}
	_, err = dao.CommunityCategory.Ctx(ctx).Where("id", id).Delete()
	return err
}

// ==================== 帖子 ====================

func (s *sCommunity) PostList(ctx context.Context, in *adminin.CommunityPostListInp) (*adminin.CommunityPostListModel, error) {
	m := dao.CommunityPost.Ctx(ctx).Where("deleted_at", 0)

	if in.CategoryId > 0 {
		m = m.Where("category_id", in.CategoryId)
	}
	if in.Keyword != "" {
		m = m.WhereLike("title", "%"+in.Keyword+"%")
	}
	if in.Tag != "" {
		m = m.WhereLike("tags", "%"+in.Tag+"%")
	}
	if in.Status >= 0 {
		m = m.Where("status", in.Status)
	}

	// 排序
	switch in.Sort {
	case "active":
		m = m.OrderDesc("is_top").OrderDesc("last_reply_at").OrderDesc("id")
	case "unanswered":
		m = m.Where("reply_count", 0).OrderDesc("is_top").OrderDesc("created_at")
	default:
		m = m.OrderDesc("is_top").OrderDesc("created_at")
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

	var posts []entity.CommunityPost
	if count > 0 {
		err = m.Page(page, size).Scan(&posts)
		if err != nil {
			return nil, err
		}
	}

	categoryMap := s.getCategoryMap(ctx)
	memberMap := s.getMemberMap(ctx, s.collectMemberIds(posts, nil))

	items := make([]adminin.CommunityPostListItem, 0, len(posts))
	for _, p := range posts {
		mi := memberMap[p.MemberId]
		items = append(items, adminin.CommunityPostListItem{
			Id: p.Id, MemberId: p.MemberId,
			MemberNickname: mi.Nickname, MemberAvatar: mi.Avatar,
			CategoryId: p.CategoryId, CategoryName: categoryMap[p.CategoryId],
			Title: p.Title, Tags: p.Tags,
			Views: p.Views, ReplyCount: p.ReplyCount, LikeCount: p.LikeCount,
			IsTop: p.IsTop, IsEssence: p.IsEssence, Status: p.Status,
			LastReplyAt: p.LastReplyAt, LastReplyMemberId: p.LastReplyMemberId,
			CreatedAt: p.CreatedAt,
		})
	}

	return &adminin.CommunityPostListModel{
		List:    items,
		PageRes: form.PageRes{Page: page, PageSize: size, Total: count},
	}, nil
}

func (s *sCommunity) PostDetail(ctx context.Context, id uint64, currentMemberId uint64) (*adminin.CommunityPostDetailModel, error) {
	var p entity.CommunityPost
	err := dao.CommunityPost.Ctx(ctx).Where("id", id).Where("deleted_at", 0).Scan(&p)
	if err != nil {
		return nil, err
	}
	if p.Id == 0 {
		return nil, gerror.NewCode(consts.CodeInvalidParam, "帖子不存在")
	}

	categoryMap := s.getCategoryMap(ctx)
	memberMap := s.getMemberMap(ctx, []uint64{p.MemberId})
	mi := memberMap[p.MemberId]

	isLiked := false
	if currentMemberId > 0 {
		cnt, _ := dao.CommunityLike.Ctx(ctx).Where("member_id", currentMemberId).Where("target_type", 1).Where("target_id", id).Count()
		isLiked = cnt > 0
	}

	return &adminin.CommunityPostDetailModel{
		Id: p.Id, MemberId: p.MemberId,
		MemberNickname: mi.Nickname, MemberAvatar: mi.Avatar,
		CategoryId: p.CategoryId, CategoryName: categoryMap[p.CategoryId],
		Title: p.Title, Content: p.Content, Tags: p.Tags,
		Views: p.Views, ReplyCount: p.ReplyCount, LikeCount: p.LikeCount,
		IsTop: p.IsTop, IsEssence: p.IsEssence, Status: p.Status,
		IsLiked: isLiked, LastReplyAt: p.LastReplyAt,
		CreatedAt: p.CreatedAt, UpdatedAt: p.UpdatedAt,
	}, nil
}

func (s *sCommunity) SitePostDetail(ctx context.Context, id uint64, currentMemberId uint64) (*adminin.CommunityPostDetailModel, error) {
	detail, err := s.PostDetail(ctx, id, currentMemberId)
	if err != nil {
		return nil, err
	}
	// 浏览量+1
	_, _ = dao.CommunityPost.Ctx(ctx).Where("id", id).Increment("views", 1)
	detail.Views++
	return detail, nil
}

func (s *sCommunity) PostSave(ctx context.Context, in *adminin.CommunityPostSaveInp, memberId uint64) (uint64, error) {
	now := uint64(time.Now().Unix())

	if in.Id > 0 {
		// 编辑：校验是否是自己的帖子
		var p entity.CommunityPost
		_ = dao.CommunityPost.Ctx(ctx).Where("id", in.Id).Where("deleted_at", 0).Scan(&p)
		if p.Id == 0 {
			return 0, gerror.NewCode(consts.CodeInvalidParam, "帖子不存在")
		}
		if p.MemberId != memberId {
			return 0, gerror.NewCode(consts.CodeNotAuthorized, "只能编辑自己的帖子")
		}
		_, err := dao.CommunityPost.Ctx(ctx).Where("id", in.Id).Data(do.CommunityPost{
			CategoryId: in.CategoryId, Title: in.Title, Content: in.Content,
			Tags: in.Tags, UpdatedAt: now,
		}).Update()
		return in.Id, err
	}

	result, err := dao.CommunityPost.Ctx(ctx).Data(do.CommunityPost{
		MemberId: memberId, CategoryId: in.CategoryId,
		Title: in.Title, Content: in.Content, Tags: in.Tags,
		Status: 1, CreatedAt: now, UpdatedAt: now,
	}).Insert()
	if err != nil {
		return 0, err
	}
	id, _ := result.LastInsertId()
	return uint64(id), nil
}

func (s *sCommunity) PostDelete(ctx context.Context, id uint64, memberId uint64) error {
	var p entity.CommunityPost
	_ = dao.CommunityPost.Ctx(ctx).Where("id", id).Where("deleted_at", 0).Scan(&p)
	if p.Id == 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "帖子不存在")
	}
	if memberId > 0 && p.MemberId != memberId {
		return gerror.NewCode(consts.CodeNotAuthorized, "只能删除自己的帖子")
	}
	now := uint64(time.Now().Unix())
	_, err := dao.CommunityPost.Ctx(ctx).Where("id", id).Data(do.CommunityPost{DeletedAt: now}).Update()
	return err
}

func (s *sCommunity) PostUpdate(ctx context.Context, in *adminin.CommunityPostUpdateInp) error {
	data := make(map[string]interface{})
	if in.IsTop != nil {
		data["is_top"] = *in.IsTop
	}
	if in.IsEssence != nil {
		data["is_essence"] = *in.IsEssence
	}
	if in.Status != nil {
		data["status"] = *in.Status
	}
	if len(data) == 0 {
		return nil
	}
	data["updated_at"] = uint64(time.Now().Unix())
	_, err := dao.CommunityPost.Ctx(ctx).Where("id", in.Id).Where("deleted_at", 0).Data(data).Update()
	return err
}

// ==================== 回复 ====================

func (s *sCommunity) ReplyList(ctx context.Context, in *adminin.CommunityReplyListInp, currentMemberId uint64) (*adminin.CommunityReplyListModel, error) {
	m := dao.CommunityReply.Ctx(ctx).Where("post_id", in.PostId).Where("deleted_at", 0).Where("status", 1)

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

	var replies []entity.CommunityReply
	if count > 0 {
		err = m.OrderAsc("created_at").Page(page, size).Scan(&replies)
		if err != nil {
			return nil, err
		}
	}

	memberIds := make([]uint64, 0, len(replies))
	for _, r := range replies {
		memberIds = append(memberIds, r.MemberId)
	}
	memberMap := s.getMemberMap(ctx, memberIds)

	// 查询当前用户的点赞记录
	likedSet := make(map[uint64]bool)
	if currentMemberId > 0 && len(replies) > 0 {
		replyIds := make([]uint64, 0, len(replies))
		for _, r := range replies {
			replyIds = append(replyIds, r.Id)
		}
		var likes []entity.CommunityLike
		_ = dao.CommunityLike.Ctx(ctx).Where("member_id", currentMemberId).Where("target_type", 2).WhereIn("target_id", replyIds).Scan(&likes)
		for _, l := range likes {
			likedSet[l.TargetId] = true
		}
	}

	// 构建树形结构
	topLevel := make([]adminin.CommunityReplyItem, 0)
	childMap := make(map[uint64][]adminin.CommunityReplyItem)

	for _, r := range replies {
		mi := memberMap[r.MemberId]
		item := adminin.CommunityReplyItem{
			Id: r.Id, PostId: r.PostId, MemberId: r.MemberId,
			MemberNickname: mi.Nickname, MemberAvatar: mi.Avatar,
			ParentId: r.ParentId, Content: r.Content,
			LikeCount: r.LikeCount, IsAccepted: r.IsAccepted,
			IsLiked: likedSet[r.Id], CreatedAt: r.CreatedAt,
		}
		if r.ParentId == 0 {
			topLevel = append(topLevel, item)
		} else {
			childMap[r.ParentId] = append(childMap[r.ParentId], item)
		}
	}

	// 挂载子回复
	for i := range topLevel {
		if children, ok := childMap[topLevel[i].Id]; ok {
			topLevel[i].Children = children
		}
	}

	return &adminin.CommunityReplyListModel{
		List:    topLevel,
		PageRes: form.PageRes{Page: page, PageSize: size, Total: count},
	}, nil
}

func (s *sCommunity) ReplySave(ctx context.Context, in *adminin.CommunityReplySaveInp, memberId uint64) (uint64, error) {
	now := uint64(time.Now().Unix())

	// 校验帖子存在
	var p entity.CommunityPost
	_ = dao.CommunityPost.Ctx(ctx).Where("id", in.PostId).Where("deleted_at", 0).Scan(&p)
	if p.Id == 0 {
		return 0, gerror.NewCode(consts.CodeInvalidParam, "帖子不存在")
	}

	result, err := dao.CommunityReply.Ctx(ctx).Data(do.CommunityReply{
		PostId: in.PostId, MemberId: memberId, ParentId: in.ParentId,
		Content: in.Content, Status: 1, CreatedAt: now, UpdatedAt: now,
	}).Insert()
	if err != nil {
		return 0, err
	}
	replyId, _ := result.LastInsertId()

	// 更新帖子回复数和最后回复信息
	_, _ = dao.CommunityPost.Ctx(ctx).Where("id", in.PostId).Data(map[string]interface{}{
		"reply_count":          p.ReplyCount + 1,
		"last_reply_at":        now,
		"last_reply_member_id": memberId,
		"updated_at":           now,
	}).Update()

	return uint64(replyId), nil
}

func (s *sCommunity) ReplyDelete(ctx context.Context, id uint64, memberId uint64) error {
	var r entity.CommunityReply
	_ = dao.CommunityReply.Ctx(ctx).Where("id", id).Where("deleted_at", 0).Scan(&r)
	if r.Id == 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "回复不存在")
	}
	if memberId > 0 && r.MemberId != memberId {
		return gerror.NewCode(consts.CodeNotAuthorized, "只能删除自己的回复")
	}
	now := uint64(time.Now().Unix())
	_, err := dao.CommunityReply.Ctx(ctx).Where("id", id).Data(do.CommunityReply{DeletedAt: now}).Update()
	if err != nil {
		return err
	}
	// 帖子回复数-1
	_, _ = dao.CommunityPost.Ctx(ctx).Where("id", r.PostId).Decrement("reply_count", 1)
	return nil
}

// ==================== 点赞 ====================

func (s *sCommunity) Like(ctx context.Context, in *adminin.CommunityLikeInp, memberId uint64) (*adminin.CommunityLikeModel, error) {
	now := uint64(time.Now().Unix())

	// 检查是否已点赞
	var existing entity.CommunityLike
	_ = dao.CommunityLike.Ctx(ctx).Where("member_id", memberId).Where("target_type", in.TargetType).Where("target_id", in.TargetId).Scan(&existing)

	if existing.Id > 0 {
		// 取消点赞
		_, _ = dao.CommunityLike.Ctx(ctx).Where("id", existing.Id).Delete()
		s.updateLikeCount(ctx, in.TargetType, in.TargetId, -1)
		return &adminin.CommunityLikeModel{IsLiked: false}, nil
	}

	// 点赞
	_, err := dao.CommunityLike.Ctx(ctx).Data(do.CommunityLike{
		MemberId: memberId, TargetType: in.TargetType, TargetId: in.TargetId, CreatedAt: now,
	}).Insert()
	if err != nil {
		return nil, err
	}
	s.updateLikeCount(ctx, in.TargetType, in.TargetId, 1)
	return &adminin.CommunityLikeModel{IsLiked: true}, nil
}

func (s *sCommunity) updateLikeCount(ctx context.Context, targetType int, targetId uint64, delta int) {
	if targetType == 1 {
		if delta > 0 {
			_, _ = dao.CommunityPost.Ctx(ctx).Where("id", targetId).Increment("like_count", delta)
		} else {
			_, _ = dao.CommunityPost.Ctx(ctx).Where("id", targetId).Decrement("like_count", -delta)
		}
	} else {
		if delta > 0 {
			_, _ = dao.CommunityReply.Ctx(ctx).Where("id", targetId).Increment("like_count", delta)
		} else {
			_, _ = dao.CommunityReply.Ctx(ctx).Where("id", targetId).Decrement("like_count", -delta)
		}
	}
}

// ==================== 热门标签 ====================

func (s *sCommunity) HotTags(ctx context.Context) (*adminin.CommunityHotTagsModel, error) {
	// 获取最近的帖子标签，统计出现频率
	var posts []entity.CommunityPost
	err := dao.CommunityPost.Ctx(ctx).Where("deleted_at", 0).Where("status", 1).
		Where("tags != ''").Fields("tags").OrderDesc("created_at").Limit(200).Scan(&posts)
	if err != nil {
		return nil, err
	}

	tagCount := make(map[string]int)
	for _, p := range posts {
		var tags []string
		if json.Unmarshal([]byte(p.Tags), &tags) == nil {
			for _, t := range tags {
				if t != "" {
					tagCount[t]++
				}
			}
		}
	}

	items := make([]adminin.CommunityHotTagItem, 0, len(tagCount))
	for tag, count := range tagCount {
		items = append(items, adminin.CommunityHotTagItem{Tag: tag, Count: count})
	}

	// 按数量排序，取前20
	for i := 0; i < len(items); i++ {
		for j := i + 1; j < len(items); j++ {
			if items[j].Count > items[i].Count {
				items[i], items[j] = items[j], items[i]
			}
		}
	}
	if len(items) > 20 {
		items = items[:20]
	}

	return &adminin.CommunityHotTagsModel{List: items}, nil
}

// ==================== 待解答帖子 ====================

func (s *sCommunity) WaitingPosts(ctx context.Context) ([]adminin.CommunityPostListItem, error) {
	var posts []entity.CommunityPost
	err := dao.CommunityPost.Ctx(ctx).Where("deleted_at", 0).Where("status", 1).Where("reply_count", 0).
		OrderDesc("created_at").Limit(10).Scan(&posts)
	if err != nil {
		return nil, err
	}

	categoryMap := s.getCategoryMap(ctx)
	memberMap := s.getMemberMap(ctx, s.collectMemberIds(posts, nil))

	items := make([]adminin.CommunityPostListItem, 0, len(posts))
	for _, p := range posts {
		mi := memberMap[p.MemberId]
		items = append(items, adminin.CommunityPostListItem{
			Id: p.Id, MemberId: p.MemberId,
			MemberNickname: mi.Nickname, MemberAvatar: mi.Avatar,
			CategoryId: p.CategoryId, CategoryName: categoryMap[p.CategoryId],
			Title: p.Title, Tags: p.Tags, Views: p.Views,
			ReplyCount: p.ReplyCount, LikeCount: p.LikeCount,
			CreatedAt: p.CreatedAt,
		})
	}
	return items, nil
}

// ==================== 内部辅助 ====================

type memberInfo struct {
	Nickname string
	Avatar   string
}

func (s *sCommunity) getCategoryMap(ctx context.Context) map[uint64]string {
	var categories []entity.CommunityCategory
	_ = dao.CommunityCategory.Ctx(ctx).Where("status", 1).Scan(&categories)
	m := make(map[uint64]string, len(categories))
	for _, c := range categories {
		m[c.Id] = c.Title
	}
	return m
}

func (s *sCommunity) getMemberMap(ctx context.Context, ids []uint64) map[uint64]memberInfo {
	m := make(map[uint64]memberInfo, len(ids))
	if len(ids) == 0 {
		return m
	}
	// 去重
	unique := make(map[uint64]bool)
	deduped := make([]uint64, 0, len(ids))
	for _, id := range ids {
		if id > 0 && !unique[id] {
			unique[id] = true
			deduped = append(deduped, id)
		}
	}
	if len(deduped) == 0 {
		return m
	}

	var members []entity.Member
	_ = dao.Member.Ctx(ctx).WhereIn("id", deduped).Fields("id,nickname,avatar").Scan(&members)
	for _, mb := range members {
		m[mb.Id] = memberInfo{Nickname: mb.Nickname, Avatar: mb.Avatar}
	}
	return m
}

func (s *sCommunity) collectMemberIds(posts []entity.CommunityPost, replies []entity.CommunityReply) []uint64 {
	ids := make([]uint64, 0, len(posts)+len(replies))
	for _, p := range posts {
		ids = append(ids, p.MemberId)
	}
	for _, r := range replies {
		ids = append(ids, r.MemberId)
	}
	return ids
}

// ==================== 全文搜索 ====================

// Search 全文搜索：帖子标题+内容+回复内容，时间衰减加权排序
// 算法说明：
//  1. 先查帖子表（title ILIKE / content ILIKE），再查回复表（content ILIKE）
//  2. 回复命中时关联到所属帖子，去重（同一帖子只保留最相关的一条）
//  3. 相关性评分：标题命中 +3，帖子内容命中 +2，回复命中 +1
//  4. 时间衰减：7天内 ×3，30天内 ×1.5，更早 ×1
//  5. 最终按 score DESC 排序，分页返回
func (s *sCommunity) Search(ctx context.Context, in *adminin.CommunitySearchInp, memberId uint64) (*adminin.CommunitySearchModel, error) {
	keyword := in.Keyword
	like := "%" + keyword + "%"
	now := uint64(time.Now().Unix())

	// 异步记录搜索词（不阻塞主流程）
	go func() {
		_ = s.recordSearch(ctx, keyword, memberId)
	}()

	// 1. 查帖子（标题命中 or 内容命中）
	type postHit struct {
		entity.CommunityPost
		TitleHit   bool
		ContentHit bool
	}
	var rawPosts []entity.CommunityPost
	err := dao.CommunityPost.Ctx(ctx).
		Where("deleted_at", 0).Where("status", 1).
		WhereLike("title", like).
		WhereOrLike("content", like).
		OrderDesc("created_at").
		Limit(200).Scan(&rawPosts)
	if err != nil {
		return nil, err
	}

	// 2. 查回复（内容命中），关联帖子ID
	var rawReplies []entity.CommunityReply
	err = dao.CommunityReply.Ctx(ctx).
		Where("deleted_at", 0).Where("status", 1).
		WhereLike("content", like).
		Fields("id,post_id,member_id,content,created_at").
		OrderDesc("created_at").
		Limit(200).Scan(&rawReplies)
	if err != nil {
		return nil, err
	}

	// 3. 收集回复命中的帖子ID（排除已在帖子命中中的）
	postHitIds := make(map[uint64]bool)
	for _, p := range rawPosts {
		postHitIds[p.Id] = true
	}
	replyPostIds := make([]uint64, 0)
	replyPostMap := make(map[uint64]entity.CommunityReply) // postId -> 最佳回复摘要
	for _, r := range rawReplies {
		if !postHitIds[r.PostId] {
			if _, exists := replyPostMap[r.PostId]; !exists {
				replyPostIds = append(replyPostIds, r.PostId)
			}
			replyPostMap[r.PostId] = r
		}
	}

	// 4. 批量查回复命中的帖子
	var replyHitPosts []entity.CommunityPost
	if len(replyPostIds) > 0 {
		err = dao.CommunityPost.Ctx(ctx).
			Where("deleted_at", 0).Where("status", 1).
			WhereIn("id", replyPostIds).
			Scan(&replyHitPosts)
		if err != nil {
			return nil, err
		}
	}

	// 5. 合并所有帖子，计算相关性分数
	type scoredPost struct {
		post       entity.CommunityPost
		matchType  string // "post" or "reply"
		replySnip  string // 回复摘要（matchType=reply时）
		score      float64
	}
	scored := make([]scoredPost, 0, len(rawPosts)+len(replyHitPosts))

	timeFactor := func(createdAt uint64) float64 {
		age := now - createdAt
		if age < 7*86400 {
			return 3.0
		} else if age < 30*86400 {
			return 1.5
		}
		return 1.0
	}

	for _, p := range rawPosts {
		base := 0.0
		titleLower := strings.ToLower(p.Title)
		contentLower := strings.ToLower(p.Content)
		kw := strings.ToLower(keyword)
		if strings.Contains(titleLower, kw) {
			base += 3
		}
		if strings.Contains(contentLower, kw) {
			base += 2
		}
		scored = append(scored, scoredPost{
			post: p, matchType: "post",
			score: base * timeFactor(p.CreatedAt),
		})
	}
	for _, p := range replyHitPosts {
		r := replyPostMap[p.Id]
		scored = append(scored, scoredPost{
			post: p, matchType: "reply",
			replySnip: excerpt(r.Content, keyword, 120),
			score:     1.0 * timeFactor(p.CreatedAt),
		})
	}

	// 6. 按 score 降序排序
	for i := 0; i < len(scored); i++ {
		for j := i + 1; j < len(scored); j++ {
			if scored[j].score > scored[i].score {
				scored[i], scored[j] = scored[j], scored[i]
			}
		}
	}

	total := len(scored)

	// 7. 分页
	page := in.Page
	pageSize := in.PageSize
	if page < 1 {
		page = 1
	}
	if pageSize < 1 || pageSize > 50 {
		pageSize = 15
	}
	start := (page - 1) * pageSize
	end := start + pageSize
	if start >= total {
		return &adminin.CommunitySearchModel{List: []adminin.CommunitySearchResultItem{}, Total: total}, nil
	}
	if end > total {
		end = total
	}
	paged := scored[start:end]

	// 8. 批量查分类和会员信息
	catMap := s.getCategoryMap(ctx)
	memberIds := make([]uint64, 0, len(paged))
	for _, sp := range paged {
		memberIds = append(memberIds, sp.post.MemberId)
	}
	mbMap := s.getMemberMap(ctx, memberIds)

	// 9. 组装结果
	items := make([]adminin.CommunitySearchResultItem, 0, len(paged))
	for _, sp := range paged {
		p := sp.post
		cat := catMap[p.CategoryId]
		mb := mbMap[p.MemberId]
		items = append(items, adminin.CommunitySearchResultItem{
			PostId:         p.Id,
			PostTitle:      highlight(p.Title, keyword),
			PostExcerpt:    highlight(excerpt(p.Content, keyword, 150), keyword),
			CategoryId:     p.CategoryId,
			CategoryName:   cat,
			MemberNickname: mb.Nickname,
			MemberAvatar:   mb.Avatar,
			MatchType:      sp.matchType,
			ReplyExcerpt:   highlight(sp.replySnip, keyword),
			Views:          p.Views,
			ReplyCount:     p.ReplyCount,
			CreatedAt:      p.CreatedAt,
		})
	}

	return &adminin.CommunitySearchModel{List: items, Total: total}, nil
}

// recordSearch 记录搜索词到数据库
func (s *sCommunity) recordSearch(ctx context.Context, keyword string, memberId uint64) error {
	keyword = strings.TrimSpace(keyword)
	if keyword == "" || len(keyword) > 50 {
		return nil
	}
	_, err := dao.CommunitySearchLog.Ctx(ctx).Insert(g.Map{
		"keyword":    keyword,
		"member_id":  memberId,
		"created_at": uint64(time.Now().Unix()),
	})
	return err
}

// HotSearchWords 热门搜索词（时间衰减加权算法）
// 算法：
//   - 取最近90天的搜索记录
//   - 7天内每次搜索权重 3，30天内权重 1.5，更早权重 1
//   - 按加权分数降序，取前10
func (s *sCommunity) HotSearchWords(ctx context.Context) (*adminin.CommunityHotSearchWordsModel, error) {
	now := uint64(time.Now().Unix())
	day7 := now - 7*86400
	day30 := now - 30*86400
	day90 := now - 90*86400

	// 拉取90天内的搜索记录，在内存中做时间衰减加权统计
	// 数据量有限（90天搜索词），内存计算比原生SQL更兼容MySQL/PgSQL
	type logRow struct {
		Keyword   string `orm:"keyword"`
		CreatedAt uint64 `orm:"created_at"`
	}
	var logs []logRow
	err := dao.CommunitySearchLog.Ctx(ctx).
		Fields("keyword", "created_at").
		WhereGTE("created_at", day90).
		Where("keyword != ''").
		Scan(&logs)
	if err != nil {
		return nil, err
	}

	scoreMap := make(map[string]float64)
	for _, row := range logs {
		w := 1.0
		if row.CreatedAt >= day7 {
			w = 3.0
		} else if row.CreatedAt >= day30 {
			w = 1.5
		}
		scoreMap[row.Keyword] += w
	}

	type kv struct {
		keyword string
		score   float64
	}
	kvList := make([]kv, 0, len(scoreMap))
	for k, v := range scoreMap {
		kvList = append(kvList, kv{k, v})
	}
	// 按分数降序排序
	for i := 0; i < len(kvList); i++ {
		for j := i + 1; j < len(kvList); j++ {
			if kvList[j].score > kvList[i].score {
				kvList[i], kvList[j] = kvList[j], kvList[i]
			}
		}
	}
	if len(kvList) > 10 {
		kvList = kvList[:10]
	}

	items := make([]adminin.CommunityHotSearchWordItem, 0, len(kvList))
	for _, kv := range kvList {
		items = append(items, adminin.CommunityHotSearchWordItem{
			Keyword: kv.keyword,
			Score:   int(kv.score),
		})
	}
	return &adminin.CommunityHotSearchWordsModel{List: items}, nil
}

// excerpt 从文本中提取包含关键词的摘要片段
func excerpt(text, keyword string, maxLen int) string {
	text = strings.ReplaceAll(text, "\n", " ")
	idx := strings.Index(strings.ToLower(text), strings.ToLower(keyword))
	if idx < 0 {
		if len([]rune(text)) > maxLen {
			return string([]rune(text)[:maxLen]) + "..."
		}
		return text
	}
	start := idx - 30
	if start < 0 {
		start = 0
	}
	end := idx + len(keyword) + 80
	if end > len(text) {
		end = len(text)
	}
	snip := text[start:end]
	if start > 0 {
		snip = "..." + snip
	}
	if end < len(text) {
		snip = snip + "..."
	}
	return snip
}

// highlight 用 <mark> 标签包裹关键词（大小写不敏感）
func highlight(text, keyword string) string {
	if keyword == "" || text == "" {
		return text
	}
	lower := strings.ToLower(text)
	kw := strings.ToLower(keyword)
	result := strings.Builder{}
	i := 0
	for {
		idx := strings.Index(lower[i:], kw)
		if idx < 0 {
			result.WriteString(text[i:])
			break
		}
		abs := i + idx
		result.WriteString(text[i:abs])
		result.WriteString("<mark>")
		result.WriteString(text[abs : abs+len(keyword)])
		result.WriteString("</mark>")
		i = abs + len(keyword)
	}
	return result.String()
}

// ==================== 收藏 ====================

func (s *sCommunity) Collect(ctx context.Context, in *adminin.CommunityCollectInp, memberId uint64) (*adminin.CommunityCollectModel, error) {
	count, err := dao.CommunityCollect.Ctx(ctx).
		Where("member_id", memberId).Where("post_id", in.PostId).Count()
	if err != nil {
		return nil, err
	}
	if count > 0 {
		// 已收藏 → 取消
		_, err = dao.CommunityCollect.Ctx(ctx).
			Where("member_id", memberId).Where("post_id", in.PostId).Delete()
		return &adminin.CommunityCollectModel{IsCollected: false}, err
	}
	// 未收藏 → 添加
	_, err = dao.CommunityCollect.Ctx(ctx).Data(g.Map{
		"member_id":  memberId,
		"post_id":    in.PostId,
		"created_at": uint64(time.Now().Unix()),
	}).Insert()
	return &adminin.CommunityCollectModel{IsCollected: true}, err
}

// ==================== 我的帖子/回复/收藏 ====================

func (s *sCommunity) MyPostList(ctx context.Context, in *adminin.CommunityMyPostListInp, memberId uint64) (*adminin.CommunityMyPostListModel, error) {
	if in.Page < 1 {
		in.Page = 1
	}
	if in.PageSize < 1 {
		in.PageSize = 20
	}
	m := dao.CommunityPost.Ctx(ctx).
		Where("member_id", memberId).Where("deleted_at", 0).
		OrderDesc("created_at")

	total, err := m.Count()
	if err != nil {
		return nil, err
	}

	var posts []entity.CommunityPost
	err = m.Page(in.Page, in.PageSize).Scan(&posts)
	if err != nil {
		return nil, err
	}

	catMap := s.getCategoryMap(ctx)

	// 查哪些帖子已有采纳答案
	acceptedPostIds := make(map[uint64]bool)
	if len(posts) > 0 {
		ids := make([]uint64, 0, len(posts))
		for _, p := range posts {
			ids = append(ids, p.Id)
		}
		var accepted []entity.CommunityReply
		_ = dao.CommunityReply.Ctx(ctx).
			Where("post_id", ids).Where("is_accepted", 1).Where("deleted_at", 0).
			Fields("post_id").Scan(&accepted)
		for _, r := range accepted {
			acceptedPostIds[r.PostId] = true
		}
	}

	items := make([]adminin.CommunityMyPostListItem, 0, len(posts))
	for _, p := range posts {
		items = append(items, adminin.CommunityMyPostListItem{
			Id:           p.Id,
			Title:        p.Title,
			CategoryName: catMap[p.CategoryId],
			ReplyCount:   p.ReplyCount,
			Views:        p.Views,
			RewardScore:  p.RewardScore,
			IsAccepted:   acceptedPostIds[p.Id],
			CreatedAt:    p.CreatedAt,
		})
	}

	return &adminin.CommunityMyPostListModel{
		List:    items,
		PageRes: form.PageRes{Page: in.Page, PageSize: in.PageSize, Total: total},
	}, nil
}

func (s *sCommunity) MyReplyList(ctx context.Context, in *adminin.CommunityMyReplyListInp, memberId uint64) (*adminin.CommunityMyReplyListModel, error) {
	if in.Page < 1 {
		in.Page = 1
	}
	if in.PageSize < 1 {
		in.PageSize = 20
	}
	m := dao.CommunityReply.Ctx(ctx).
		Where("member_id", memberId).Where("deleted_at", 0).
		OrderDesc("created_at")

	total, err := m.Count()
	if err != nil {
		return nil, err
	}

	var replies []entity.CommunityReply
	err = m.Page(in.Page, in.PageSize).Scan(&replies)
	if err != nil {
		return nil, err
	}

	// 批量查帖子标题
	postIds := make([]uint64, 0, len(replies))
	for _, r := range replies {
		postIds = append(postIds, r.PostId)
	}
	postTitleMap := make(map[uint64]string)
	if len(postIds) > 0 {
		var posts []entity.CommunityPost
		_ = dao.CommunityPost.Ctx(ctx).Where("id", postIds).Fields("id,title").Scan(&posts)
		for _, p := range posts {
			postTitleMap[p.Id] = p.Title
		}
	}

	items := make([]adminin.CommunityMyReplyListItem, 0, len(replies))
	for _, r := range replies {
		items = append(items, adminin.CommunityMyReplyListItem{
			Id:         r.Id,
			PostId:     r.PostId,
			PostTitle:  postTitleMap[r.PostId],
			Content:    excerpt(r.Content, "", 80),
			IsAccepted: r.IsAccepted,
			LikeCount:  r.LikeCount,
			CreatedAt:  r.CreatedAt,
		})
	}

	return &adminin.CommunityMyReplyListModel{
		List:    items,
		PageRes: form.PageRes{Page: in.Page, PageSize: in.PageSize, Total: total},
	}, nil
}

func (s *sCommunity) MyCollectList(ctx context.Context, in *adminin.CommunityMyCollectListInp, memberId uint64) (*adminin.CommunityMyCollectListModel, error) {
	if in.Page < 1 {
		in.Page = 1
	}
	if in.PageSize < 1 {
		in.PageSize = 20
	}
	m := dao.CommunityCollect.Ctx(ctx).
		Where("member_id", memberId).
		OrderDesc("created_at")

	total, err := m.Count()
	if err != nil {
		return nil, err
	}

	type collectRow struct {
		PostId    uint64 `orm:"post_id"`
		CreatedAt uint64 `orm:"created_at"`
	}
	var collects []collectRow
	err = m.Page(in.Page, in.PageSize).Scan(&collects)
	if err != nil {
		return nil, err
	}

	postIds := make([]uint64, 0, len(collects))
	collectTimeMap := make(map[uint64]uint64)
	for _, c := range collects {
		postIds = append(postIds, c.PostId)
		collectTimeMap[c.PostId] = c.CreatedAt
	}

	catMap := s.getCategoryMap(ctx)
	var posts []entity.CommunityPost
	if len(postIds) > 0 {
		_ = dao.CommunityPost.Ctx(ctx).
			Where("id", postIds).Where("deleted_at", 0).Scan(&posts)
	}

	items := make([]adminin.CommunityMyCollectListItem, 0, len(posts))
	for _, p := range posts {
		items = append(items, adminin.CommunityMyCollectListItem{
			PostId:       p.Id,
			Title:        p.Title,
			CategoryName: catMap[p.CategoryId],
			ReplyCount:   p.ReplyCount,
			Views:        p.Views,
			CreatedAt:    collectTimeMap[p.Id],
		})
	}

	return &adminin.CommunityMyCollectListModel{
		List:    items,
		PageRes: form.PageRes{Page: in.Page, PageSize: in.PageSize, Total: total},
	}, nil
}

// ==================== 悬赏积分采纳 ====================

// AcceptReply 采纳最佳回答，若帖子有悬赏积分则转移给答主
func (s *sCommunity) AcceptReply(ctx context.Context, replyId uint64, memberId uint64) error {
	var r entity.CommunityReply
	_ = dao.CommunityReply.Ctx(ctx).Where("id", replyId).Where("deleted_at", 0).Scan(&r)
	if r.Id == 0 {
		return gerror.NewCode(consts.CodeInvalidParam, "回复不存在")
	}

	// 校验是否是帖子作者
	var p entity.CommunityPost
	_ = dao.CommunityPost.Ctx(ctx).Where("id", r.PostId).Where("deleted_at", 0).Scan(&p)
	if p.Id == 0 || p.MemberId != memberId {
		return gerror.NewCode(consts.CodeNotAuthorized, "只有帖子作者才能采纳回答")
	}

	// 取消之前的采纳
	_, _ = dao.CommunityReply.Ctx(ctx).Where("post_id", r.PostId).Where("is_accepted", 1).Data(do.CommunityReply{IsAccepted: 0}).Update()

	// 设置新的采纳
	_, err := dao.CommunityReply.Ctx(ctx).Where("id", replyId).Data(do.CommunityReply{IsAccepted: 1}).Update()
	if err != nil {
		return err
	}

	// 悬赏积分转移：给答主加积分
	rewardScore := p.RewardScore
	if rewardScore > 0 && r.MemberId != memberId {
		// 给答主加积分
		s.transferRewardScore(ctx, p.Id, r.MemberId, rewardScore)
	}
	return nil
}

// transferRewardScore 悬赏积分转移给答主
func (s *sCommunity) transferRewardScore(ctx context.Context, postId uint64, toMemberId uint64, score int) {
	var m entity.Member
	if err := dao.Member.Ctx(ctx).Where("id", toMemberId).Scan(&m); err != nil || m.Id == 0 {
		return
	}
	before := m.Score
	after := before + score
	_, _ = dao.Member.Ctx(ctx).Where("id", toMemberId).Data(g.Map{"score": after}).Update()
	_, _ = dao.MemberScoreLog.Ctx(ctx).Data(g.Map{
		"member_id":  toMemberId,
		"score":      score,
		"before":     before,
		"after":      after,
		"memo":       "悬赏回答被采纳奖励",
		"created_at": uint64(time.Now().Unix()),
	}).Insert()
	// 清零帖子悬赏积分（防止重复发放）
	_, _ = dao.CommunityPost.Ctx(ctx).Where("id", postId).Data(g.Map{"reward_score": 0}).Update()
}
