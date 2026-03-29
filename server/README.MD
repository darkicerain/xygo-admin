# XYGo Admin - Server

基于 GoFrame v2 的后端服务，提供 RESTful API。

## 快速启动

```bash
# 配置数据库连接
# 编辑 manifest/config/config.yaml

# 启动服务
gf run main.go
```

## 工具命令

```bash
# 交互式菜单（选择要执行的命令）
gf run tools.go

# 直接执行命令
gf run tools.go --args "migrate up"         # 执行数据库迁移
gf run tools.go --args "migrate status"     # 查看迁移状态
gf run tools.go --args "migrate history"    # 查看迁移历史
gf run tools.go --args "check-tpl"          # 检查模板语法
```

## 代码生成

```bash
# 根据数据库表生成 DAO/Model
gf gen dao

# 根据 Logic 层生成 Service 接口
gf gen service
```

详细文档参见项目根目录 README。
