# 系统配置使用说明

## 后端调用配置

### 获取整个分组的配置

```go
import "xygo/internal/service"

// 获取基础配置分组
cfgMap, err := service.SysConfig().GetConfigByGroup(ctx, "basics")
if err != nil {
    return err
}

// 使用配置项
siteName := cfgMap["site_name"]      // 站点名称
homePage := cfgMap["home_page"]      // 默认首页
domain := cfgMap["site_domain"]      // 网站地址
```

### 获取单个配置项

```go
// 方式1：通过分组获取后取值
cfg, err := service.SysConfig().GetConfigByGroup(ctx, "mail")
if err != nil {
    return err
}
smtpHost := cfg["smtp_host"]
smtpPort := cfg["smtp_port"]

// 方式2：直接查询（如果需要）
var item entity.SysConfig
err := dao.SysConfig.Ctx(ctx).Where("`key` = ?", "smtp_host").Scan(&item)
```

## 配置变量名说明

### 基础设置（basics）
- `site_name` - 站点名称
- `site_subtitle` - 站点副标题
- `site_logo` - 网站LOGO
- `site_icp` - ICP备案号
- `site_copyright` - 版权信息
- `site_domain` - 网站地址
- `site_description` - 站点描述
- `theme_color` - 主题主色调
- `site_timezone` - 站点时区

### 邮件配置（mail）
- `smtp_host` - SMTP服务器
- `smtp_port` - SMTP端口
- `smtp_user` - SMTP用户名
- `smtp_pass` - SMTP密码
- `smtp_secure` - SSL加密

### 对象存储（oss）
- `oss_driver` - 存储驱动（local/ali/tencent等）
- `oss_endpoint` - 节点地址
- `oss_access_key` - AccessKey
- `oss_secret_key` - SecretKey
- `oss_bucket` - Bucket名称
- `oss_domain` - 访问域名

### 安全设置（security）
- `forbidden_ips` - 禁止访问IP列表
- `login_fail_max` - 登录失败最大次数
- `login_captcha` - 登录验证码开关
- `password_level` - 密码强度等级
- `login_protect` - 登录保护开关

## allow_del 字段说明

配置项的 `allow_del` 字段控制是否允许删除：

- `0` - 核心配置，不允许删除（如：站点名称、数据库配置等）
- `1` - 可选配置，允许删除（如：自定义配置项）

### 设置 allow_del

```sql
-- 设置配置项为可删除
UPDATE xy_sys_config SET allow_del = 1 WHERE `key` = 'custom_config';

-- 设置配置项为不可删除（核心配置）
UPDATE xy_sys_config SET allow_del = 0 WHERE `key` = 'site_name';
```

## 前端操作

### 复制变量名
1. 鼠标悬停在配置项上
2. 点击右侧的三点菜单
3. 选择"复制变量名"
4. 配置项的 key 已复制到剪贴板
5. 在代码中使用：`service.SysConfig().GetConfigByGroup(ctx, "group")["key"]`

### 删除配置
1. 鼠标悬停在配置项上
2. 点击右侧的三点菜单
3. 选择"删除配置"（如果 allow_del=0 则显示为禁用状态）
4. 确认删除操作
5. 配置项从数据库中删除

## 示例：使用邮件配置

```go
package service

import (
    "context"
    "xygo/internal/service"
)

func SendEmail(ctx context.Context, to, subject, body string) error {
    // 获取邮件配置
    mailCfg, err := service.SysConfig().GetConfigByGroup(ctx, "mail")
    if err != nil {
        return err
    }
    
    // 使用配置项
    smtpHost := mailCfg["smtp_host"]
    smtpPort := mailCfg["smtp_port"]
    smtpUser := mailCfg["smtp_user"]
    smtpPass := mailCfg["smtp_pass"]
    
    // ... 发送邮件逻辑
    return nil
}
```

## 注意事项

1. **变量名格式**：配置项的 key 统一使用下划线命名（snake_case），如 `site_name`、`smtp_host`
2. **核心配置保护**：重要的系统配置应设置 `allow_del=0`，防止误删除
3. **配置缓存**：当前实现为无缓存模式，每次调用直接查库，如需缓存可在 service 层实现
4. **配置值类型**：所有配置值以字符串形式存储，使用时需要根据实际类型转换
