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
# 交互式菜单
go run tools.go

# 直接执行命令
go run tools.go migrate up         # 执行数据库迁移
go run tools.go migrate status     # 查看迁移状态
go run tools.go migrate history    # 查看迁移历史
go run tools.go check-tpl          # 检查模板语法
go run tools.go update             # 在线更新
```

## 扩展管理

```bash
# 安装扩展（交互式）
go run tools.go
# 选择 [5] addon install → 输入扩展名（如 tenant）

# 卸载扩展
go run tools.go
# 选择 [6] addon uninstall → 输入扩展名

# 命令行方式
go run tools.go addon install tenant
go run tools.go addon uninstall tenant
```

扩展包放在 `server/addons/` 目录下，文件名格式为 `{name}.zip`。

安装后需要执行：
1. `gf gen dao` - 重新生成数据模型
2. `gf gen service` - 重新生成服务接口
3. 重启服务

## 代码生成

```bash
# 根据数据库表生成 DAO/Model
gf gen dao

# 根据 Logic 层生成 Service 接口
gf gen service
```

## 目录说明

```
server/
├── addons/              # 扩展包目录（*.zip）
├── api/                 # API 定义
├── cmd_tools/migrate/   # 数据库迁移脚本
├── hack/                # gf 工具配置
├── internal/            # 业务逻辑
├── manifest/config/     # 运行配置
├── resource/            # 静态资源
├── main.go              # 服务入口
└── tools.go             # 工具命令入口
```

详细文档参见项目根目录 README。
