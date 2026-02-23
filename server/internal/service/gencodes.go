package service

import (
	"context"
	"xygo/internal/model/input/adminin"
)

type (
	IGenCodes interface {
		// Selects 获取选项
		Selects(ctx context.Context) (*adminin.GenCodesSelectsModel, error)
		// TableSelect 获取数据库表列表
		TableSelect(ctx context.Context) (*adminin.GenCodesTableSelectModel, error)
		// ColumnList 获取表字段列表
		ColumnList(ctx context.Context, in *adminin.GenCodesColumnListInp) (*adminin.GenCodesColumnListModel, error)
		// List 生成记录列表
		List(ctx context.Context, in *adminin.GenCodesListInp) (*adminin.GenCodesListModel, error)
		// View 查看详情
		View(ctx context.Context, in *adminin.GenCodesViewInp) (*adminin.GenCodesViewModel, error)
		// Edit 保存配置
		Edit(ctx context.Context, in *adminin.GenCodesEditInp) (*adminin.GenCodesEditModel, error)
		// Delete 删除配置
		Delete(ctx context.Context, in *adminin.GenCodesDeleteInp) error
		// Preview 预览代码
		Preview(ctx context.Context, in *adminin.GenCodesPreviewInp) (*adminin.GenCodesPreviewModel, error)
		// Build 执行生成
		Build(ctx context.Context, in *adminin.GenCodesBuildInp) error
		// CreateTable 创建数据表
		CreateTable(ctx context.Context, in *adminin.GenCodesCreateTableInp) (*adminin.GenCodesCreateTableModel, error)
		// PublishFrontend 发布前端文件
		PublishFrontend(ctx context.Context) error
		// SyncFields 预览字段变更
		SyncFields(ctx context.Context, in *adminin.GenCodesSyncFieldsInp) (*adminin.GenCodesSyncFieldsModel, error)
		// ExecuteDDL 执行字段同步DDL
		ExecuteDDL(ctx context.Context, in *adminin.GenCodesExecuteDDLInp) error
	}
)

var localGenCodes IGenCodes

func GenCodes() IGenCodes {
	if localGenCodes == nil {
		panic("implement not found for interface IGenCodes, forgot register?")
	}
	return localGenCodes
}

func RegisterGenCodes(i IGenCodes) {
	localGenCodes = i
}
