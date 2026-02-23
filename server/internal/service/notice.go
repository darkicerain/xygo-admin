package service

import (
	"context"
	"xygo/internal/model/input/adminin"
)

type (
	INotice interface {
		// List 通知列表（管理端）
		List(ctx context.Context, in *adminin.NoticeListInp) (*adminin.NoticeListModel, error)
		// Edit 创建/编辑通知
		Edit(ctx context.Context, in *adminin.NoticeEditInp, senderId uint64) (uint64, error)
		// Delete 删除通知
		Delete(ctx context.Context, id uint64) error
		// PullMessages 拉取当前用户的消息
		PullMessages(ctx context.Context, userId uint64) (*adminin.PullMessagesModel, error)
		// UnreadCount 获取未读数
		UnreadCount(ctx context.Context, userId uint64) ([]adminin.UnreadCountItem, int, error)
		// Read 标记已读
		Read(ctx context.Context, noticeId, userId uint64) error
		// ReadAll 标记全部已读
		ReadAll(ctx context.Context, noticeType int, userId uint64) error
	}
)

var localNotice INotice

func Notice() INotice {
	if localNotice == nil {
		panic("implement not found for interface INotice, forgot register?")
	}
	return localNotice
}

func RegisterNotice(i INotice) {
	localNotice = i
}
