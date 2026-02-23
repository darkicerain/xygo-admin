// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"xygo/internal/model/input/adminin"
)

type (
	ICommunity interface {
		CategoryList(ctx context.Context, in *adminin.CommunityCategoryListInp) (*adminin.CommunityCategoryListModel, error)
		CategorySave(ctx context.Context, in *adminin.CommunityCategorySaveInp) (uint64, error)
		CategoryDelete(ctx context.Context, id uint64) error
		PostList(ctx context.Context, in *adminin.CommunityPostListInp) (*adminin.CommunityPostListModel, error)
		PostDetail(ctx context.Context, id uint64, currentMemberId uint64) (*adminin.CommunityPostDetailModel, error)
		SitePostDetail(ctx context.Context, id uint64, currentMemberId uint64) (*adminin.CommunityPostDetailModel, error)
		PostSave(ctx context.Context, in *adminin.CommunityPostSaveInp, memberId uint64) (uint64, error)
		PostDelete(ctx context.Context, id uint64, memberId uint64) error
		PostUpdate(ctx context.Context, in *adminin.CommunityPostUpdateInp) error
		ReplyList(ctx context.Context, in *adminin.CommunityReplyListInp, currentMemberId uint64) (*adminin.CommunityReplyListModel, error)
		ReplySave(ctx context.Context, in *adminin.CommunityReplySaveInp, memberId uint64) (uint64, error)
		ReplyDelete(ctx context.Context, id uint64, memberId uint64) error
		Like(ctx context.Context, in *adminin.CommunityLikeInp, memberId uint64) (*adminin.CommunityLikeModel, error)
		HotTags(ctx context.Context) (*adminin.CommunityHotTagsModel, error)
		WaitingPosts(ctx context.Context) ([]adminin.CommunityPostListItem, error)
		// Search 全文搜索：帖子标题+内容+回复内容，时间衰减加权排序
		// 算法说明：
		//  1. 先查帖子表（title ILIKE / content ILIKE），再查回复表（content ILIKE）
		//  2. 回复命中时关联到所属帖子，去重（同一帖子只保留最相关的一条）
		//  3. 相关性评分：标题命中 +3，帖子内容命中 +2，回复命中 +1
		//  4. 时间衰减：7天内 ×3，30天内 ×1.5，更早 ×1
		//  5. 最终按 score DESC 排序，分页返回
		Search(ctx context.Context, in *adminin.CommunitySearchInp, memberId uint64) (*adminin.CommunitySearchModel, error)
		// HotSearchWords 热门搜索词（时间衰减加权算法）
		// 算法：
		//   - 取最近90天的搜索记录
		//   - 7天内每次搜索权重 3，30天内权重 1.5，更早权重 1
		//   - 按加权分数降序，取前10
		HotSearchWords(ctx context.Context) (*adminin.CommunityHotSearchWordsModel, error)
		Collect(ctx context.Context, in *adminin.CommunityCollectInp, memberId uint64) (*adminin.CommunityCollectModel, error)
		MyPostList(ctx context.Context, in *adminin.CommunityMyPostListInp, memberId uint64) (*adminin.CommunityMyPostListModel, error)
		MyReplyList(ctx context.Context, in *adminin.CommunityMyReplyListInp, memberId uint64) (*adminin.CommunityMyReplyListModel, error)
		MyCollectList(ctx context.Context, in *adminin.CommunityMyCollectListInp, memberId uint64) (*adminin.CommunityMyCollectListModel, error)
		// AcceptReply 采纳最佳回答，若帖子有悬赏积分则转移给答主
		AcceptReply(ctx context.Context, replyId uint64, memberId uint64) error
	}
)

var (
	localCommunity ICommunity
)

func Community() ICommunity {
	if localCommunity == nil {
		panic("implement not found for interface ICommunity, forgot register?")
	}
	return localCommunity
}

func RegisterCommunity(i ICommunity) {
	localCommunity = i
}
