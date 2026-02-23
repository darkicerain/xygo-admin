package service

import (
	"context"
	"xygo/internal/model/input/adminin"
)

type (
	IChat interface {
		// Sessions 获取当前用户的会话列表
		Sessions(ctx context.Context, userId uint64) ([]adminin.ChatSessionItem, error)
		// CreateSession 创建会话
		CreateSession(ctx context.Context, in *adminin.ChatSessionCreateInp, creatorId uint64) (*adminin.ChatSessionCreateModel, error)
		// DeleteSession 删除会话（软删除，仅对当前用户生效）
		DeleteSession(ctx context.Context, in *adminin.ChatSessionDeleteInp, userId uint64) error
		// Messages 获取消息列表
		Messages(ctx context.Context, in *adminin.ChatMessageListInp, userId uint64) (*adminin.ChatMessageListModel, error)
		// SendMessage 发送消息
		SendMessage(ctx context.Context, in *adminin.ChatSendMessageInp, senderId uint64) (*adminin.ChatSendMessageModel, error)
		// MarkRead 标记会话已读
		MarkRead(ctx context.Context, sessionId, userId uint64) error
		// Contacts 获取所有管理员作为联系人
		Contacts(ctx context.Context, currentUserId uint64) ([]adminin.ChatContactItem, error)
		// GroupUpdate 编辑群聊
		GroupUpdate(ctx context.Context, in *adminin.ChatGroupUpdateInp, userId uint64) error
		// UnreadTotal 获取聊天未读总数
		UnreadTotal(ctx context.Context, userId uint64) (int, error)
	}
)

var localChat IChat

func Chat() IChat {
	if localChat == nil {
		panic("implement not found for interface IChat, forgot register?")
	}
	return localChat
}

func RegisterChat(i IChat) {
	localChat = i
}
