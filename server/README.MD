# XYGo Admin - Server

基于 GoFrame v2 的后端服务，提供 RESTful API。

## 快速启动

```bash
# 配置数据库连接
# 编辑 manifest/config/config.yaml

# 启动
go run main.go
```

## 代码生成

```bash
# 根据数据库表生成 DAO/Model
gf gen dao

# 根据 Logic 层生成 Service 接口
gf gen service
```

详细文档参见项目根目录 README。
