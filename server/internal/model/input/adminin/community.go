package adminin

import "xygo/internal/model/input/form"

// ==================== 社区分类 ====================

type CommunityCategoryListInp struct {
	Status int `p:"status" d:"-1" json:"status" dc:"状态:1正常,2禁用,-1全部"`
}

type CommunityCategoryItem struct {
	Id        uint64 `json:"id"`
	Title     string `json:"title"`
	Icon      string `json:"icon"`
	Sort      int    `json:"sort"`
	Status    int    `json:"status"`
	CreatedAt uint64 `json:"createdAt"`
	UpdatedAt uint64 `json:"updatedAt"`
}

type CommunityCategoryListModel struct {
	List []CommunityCategoryItem `json:"list"`
}

type CommunityCategorySaveInp struct {
	Id     uint64 `p:"id"     json:"id"`
	Title  string `p:"title"  v:"required#分类名称不能为空" json:"title"`
	Icon   string `p:"icon"   json:"icon"`
	Sort   int    `p:"sort"   d:"0" json:"sort"`
	Status int    `p:"status" d:"1" json:"status"`
}

type CommunityCategoryDeleteInp struct {
	Id uint64 `p:"id" v:"required#分类ID不能为空" json:"id"`
}

// ==================== 社区帖子 ====================

type CommunityPostListInp struct {
	form.PageReq
	CategoryId uint64 `p:"categoryId" json:"categoryId" dc:"分类ID"`
	Keyword    string `p:"keyword"    json:"keyword"    dc:"关键词搜索"`
	Tag        string `p:"tag"        json:"tag"        dc:"标签筛选"`
	Status     int    `p:"status" d:"-1" json:"status"  dc:"状态:-1全部"`
	Sort       string `p:"sort"   d:"default" json:"sort" dc:"排序:default/active/unanswered"`
}

type CommunityPostListItem struct {
	Id                uint64 `json:"id"`
	MemberId          uint64 `json:"memberId"`
	MemberNickname    string `json:"memberNickname"`
	MemberAvatar      string `json:"memberAvatar"`
	CategoryId        uint64 `json:"categoryId"`
	CategoryName      string `json:"categoryName"`
	Title             string `json:"title"`
	Tags              string `json:"tags"`
	Views             int    `json:"views"`
	ReplyCount        int    `json:"replyCount"`
	LikeCount         int    `json:"likeCount"`
	IsTop             int    `json:"isTop"`
	IsEssence         int    `json:"isEssence"`
	Status            int    `json:"status"`
	LastReplyAt       uint64 `json:"lastReplyAt"`
	LastReplyMemberId uint64 `json:"lastReplyMemberId"`
	CreatedAt         uint64 `json:"createdAt"`
}

type CommunityPostListModel struct {
	List []CommunityPostListItem `json:"list"`
	form.PageRes
}

type CommunityPostDetailInp struct {
	Id uint64 `p:"id" v:"required#帖子ID不能为空" json:"id"`
}

type CommunityPostDetailModel struct {
	Id                uint64 `json:"id"`
	MemberId          uint64 `json:"memberId"`
	MemberNickname    string `json:"memberNickname"`
	MemberAvatar      string `json:"memberAvatar"`
	CategoryId        uint64 `json:"categoryId"`
	CategoryName      string `json:"categoryName"`
	Title             string `json:"title"`
	Content           string `json:"content"`
	Tags              string `json:"tags"`
	Views             int    `json:"views"`
	ReplyCount        int    `json:"replyCount"`
	LikeCount         int    `json:"likeCount"`
	IsTop             int    `json:"isTop"`
	IsEssence         int    `json:"isEssence"`
	Status            int    `json:"status"`
	IsLiked           bool   `json:"isLiked"`
	RewardScore       int    `json:"rewardScore"`
	IsAccepted        bool   `json:"isAccepted"` // 是否已有采纳答案
	LastReplyAt       uint64 `json:"lastReplyAt"`
	CreatedAt         uint64 `json:"createdAt"`
	UpdatedAt         uint64 `json:"updatedAt"`
}

// CommunityPostSaveInp 会员发帖/编辑
type CommunityPostSaveInp struct {
	Id          uint64 `p:"id"          json:"id"`
	CategoryId  uint64 `p:"categoryId"  v:"required#分类不能为空" json:"categoryId"`
	Title       string `p:"title"       v:"required#标题不能为空" json:"title"`
	Content     string `p:"content"     v:"required#内容不能为空" json:"content"`
	Tags        string `p:"tags"        json:"tags"`
	RewardScore int    `p:"rewardScore" d:"0" json:"rewardScore" dc:"悬赏积分，0=不悬赏"`
	CaptchaId   string `p:"captchaId"   v:"required#验证码ID不能为空" json:"captchaId"`
	CaptchaInfo string `p:"captchaInfo" v:"required#验证码信息不能为空" json:"captchaInfo"`
}

type CommunityPostDeleteInp struct {
	Id uint64 `p:"id" v:"required#帖子ID不能为空" json:"id"`
}

// CommunityPostUpdateInp 后台编辑帖子（置顶/精华/状态）
type CommunityPostUpdateInp struct {
	Id        uint64 `p:"id"        v:"required#帖子ID不能为空" json:"id"`
	IsTop     *int   `p:"isTop"     json:"isTop"`
	IsEssence *int   `p:"isEssence" json:"isEssence"`
	Status    *int   `p:"status"    json:"status"`
}

// ==================== 社区回复 ====================

type CommunityReplyListInp struct {
	form.PageReq
	PostId uint64 `p:"postId" v:"required#帖子ID不能为空" json:"postId"`
}

type CommunityReplyItem struct {
	Id             uint64               `json:"id"`
	PostId         uint64               `json:"postId"`
	MemberId       uint64               `json:"memberId"`
	MemberNickname string               `json:"memberNickname"`
	MemberAvatar   string               `json:"memberAvatar"`
	ParentId       uint64               `json:"parentId"`
	Content        string               `json:"content"`
	LikeCount      int                  `json:"likeCount"`
	IsAccepted     int                  `json:"isAccepted"`
	IsLiked        bool                 `json:"isLiked"`
	CreatedAt      uint64               `json:"createdAt"`
	Children       []CommunityReplyItem `json:"children,omitempty"`
}

type CommunityReplyListModel struct {
	List []CommunityReplyItem `json:"list"`
	form.PageRes
}

type CommunityReplySaveInp struct {
	PostId     uint64 `p:"postId"     v:"required#帖子ID不能为空" json:"postId"`
	ParentId   uint64 `p:"parentId"   d:"0" json:"parentId"`
	Content    string `p:"content"    v:"required#回复内容不能为空" json:"content"`
	CaptchaId  string `p:"captchaId"  v:"required#验证码ID不能为空" json:"captchaId"`
	CaptchaInfo string `p:"captchaInfo" v:"required#验证码信息不能为空" json:"captchaInfo"`
}

type CommunityReplyDeleteInp struct {
	Id uint64 `p:"id" v:"required#回复ID不能为空" json:"id"`
}

// ==================== 点赞 ====================

type CommunityLikeInp struct {
	TargetType int    `p:"targetType" v:"required|in:1,2#目标类型不能为空|目标类型无效" json:"targetType" dc:"1=帖子,2=回复"`
	TargetId   uint64 `p:"targetId"   v:"required#目标ID不能为空" json:"targetId"`
}

type CommunityLikeModel struct {
	IsLiked bool `json:"isLiked"` // 操作后的状态
}

// ==================== 采纳回答 ====================

type CommunityAcceptReplyInp struct {
	ReplyId uint64 `p:"replyId" v:"required#回复ID不能为空" json:"replyId"`
}

// ==================== 热门标签 ====================

type CommunityHotTagItem struct {
	Tag   string `json:"tag"`
	Count int    `json:"count"`
}

type CommunityHotTagsModel struct {
	List []CommunityHotTagItem `json:"list"`
}

// ==================== 全文搜索 ====================

type CommunitySearchInp struct {
	form.PageReq
	Keyword string `p:"keyword" v:"required#搜索词不能为空" json:"keyword"`
}

// CommunitySearchResultItem 搜索结果条目
type CommunitySearchResultItem struct {
	PostId       uint64 `json:"postId"`       // 帖子ID
	PostTitle    string `json:"postTitle"`    // 帖子标题（含高亮标记）
	PostExcerpt  string `json:"postExcerpt"`  // 帖子内容摘要（含高亮标记）
	CategoryId   uint64 `json:"categoryId"`
	CategoryName string `json:"categoryName"`
	MemberNickname string `json:"memberNickname"`
	MemberAvatar   string `json:"memberAvatar"`
	MatchType    string `json:"matchType"`    // "post"=帖子命中, "reply"=回复命中
	ReplyExcerpt string `json:"replyExcerpt"` // 命中的回复摘要（含高亮标记），matchType=reply时有值
	Views        int    `json:"views"`
	ReplyCount   int    `json:"replyCount"`
	CreatedAt    uint64 `json:"createdAt"`
}

type CommunitySearchModel struct {
	List  []CommunitySearchResultItem `json:"list"`
	Total int                         `json:"total"`
}

// ==================== 热门搜索词 ====================

type CommunityHotSearchWordItem struct {
	Keyword string `json:"keyword"`
	Score   int    `json:"score"` // 热度分（时间衰减加权）
}

type CommunityHotSearchWordsModel struct {
	List []CommunityHotSearchWordItem `json:"list"`
}

// ==================== 我的社区（会员中心） ====================

type CommunityMyPostListInp struct {
	form.PageReq
}

type CommunityMyPostListItem struct {
	Id           uint64 `json:"id"`
	Title        string `json:"title"`
	CategoryName string `json:"categoryName"`
	ReplyCount   int    `json:"replyCount"`
	Views        int    `json:"views"`
	RewardScore  int    `json:"rewardScore"`
	IsAccepted   bool   `json:"isAccepted"`
	CreatedAt    uint64 `json:"createdAt"`
}

type CommunityMyPostListModel struct {
	List []CommunityMyPostListItem `json:"list"`
	form.PageRes
}

type CommunityMyReplyListInp struct {
	form.PageReq
}

type CommunityMyReplyListItem struct {
	Id         uint64 `json:"id"`
	PostId     uint64 `json:"postId"`
	PostTitle  string `json:"postTitle"`
	Content    string `json:"content"`
	IsAccepted int    `json:"isAccepted"`
	LikeCount  int    `json:"likeCount"`
	CreatedAt  uint64 `json:"createdAt"`
}

type CommunityMyReplyListModel struct {
	List []CommunityMyReplyListItem `json:"list"`
	form.PageRes
}

type CommunityMyCollectListInp struct {
	form.PageReq
}

type CommunityMyCollectListItem struct {
	PostId       uint64 `json:"postId"`
	Title        string `json:"title"`
	CategoryName string `json:"categoryName"`
	ReplyCount   int    `json:"replyCount"`
	Views        int    `json:"views"`
	CreatedAt    uint64 `json:"createdAt"` // 收藏时间
}

type CommunityMyCollectListModel struct {
	List []CommunityMyCollectListItem `json:"list"`
	form.PageRes
}

// CommunityCollectInp 收藏/取消收藏
type CommunityCollectInp struct {
	PostId uint64 `p:"postId" v:"required#帖子ID不能为空" json:"postId"`
}

type CommunityCollectModel struct {
	IsCollected bool `json:"isCollected"`
}
