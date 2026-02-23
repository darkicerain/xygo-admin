# 系统配置支持的组件类型

系统配置共支持 **26 种组件类型**，可以满足各种配置需求。

## 📝 基础输入类（5种）

### 1. text / string - 文本输入框
```json
{
  "type": "text",
  "key": "site_name",
  "name": "站点名称",
  "value": "xy-go-admin",
  "remark": "请输入站点名称"
}
```
**组件**: `ElInput`  
**特性**: 单行文本输入，支持清空

---

### 2. password - 密码输入框
```json
{
  "type": "password",
  "key": "smtp_pass",
  "name": "SMTP密码",
  "value": "",
  "remark": "请输入SMTP密码"
}
```
**组件**: `ElInput` (type="password")  
**特性**: 密码输入，支持显示/隐藏

---

### 3. textarea - 多行文本框
```json
{
  "type": "textarea",
  "key": "site_description",
  "name": "站点描述",
  "value": "",
  "options": {
    "rows": 4
  }
}
```
**组件**: `ElInput` (type="textarea")  
**特性**: 多行文本输入，可配置行数

---

### 4. number - 数字输入框
```json
{
  "type": "number",
  "key": "smtp_port",
  "name": "SMTP端口",
  "value": "465",
  "options": {
    "min": 1,
    "max": 65535,
    "step": 1
  }
}
```
**组件**: `ElInputNumber`  
**特性**: 数字输入，支持最小值、最大值、步长

---

### 5. json / object - JSON编辑器
```json
{
  "type": "json",
  "key": "extra_config",
  "name": "额外配置",
  "value": "{}",
  "remark": "请输入JSON格式数据"
}
```
**组件**: `ElInput` (type="textarea")  
**特性**: JSON格式数据输入，6行高度

---

## ✅ 选择类（8种）

### 6. switch - 开关
```json
{
  "type": "switch",
  "key": "site_closed",
  "name": "站点关闭",
  "value": "0"
}
```
**组件**: `ElSwitch`  
**值**: "1" 开启 / "0" 关闭

---

### 7. checkbox - 复选框
```json
{
  "type": "checkbox",
  "key": "site_closed",
  "name": "是否关闭",
  "value": "0",
  "options": {
    "label": "开启后前台将无法访问"
  }
}
```
**组件**: `ElCheckbox`  
**值**: "1" 选中 / "0" 未选中

---

### 8. radio - 单选框组
```json
{
  "type": "radio",
  "key": "password_level",
  "name": "密码强度",
  "value": "medium",
  "options": {
    "options": [
      {"label": "低", "value": "low"},
      {"label": "中", "value": "medium"},
      {"label": "高", "value": "high"}
    ]
  }
}
```
**组件**: `ElRadioGroup` + `ElRadio`  
**特性**: 单选按钮组

---

### 9. select - 下拉单选
```json
{
  "type": "select",
  "key": "oss_driver",
  "name": "存储驱动",
  "value": "local",
  "options": {
    "options": [
      {"label": "本地存储", "value": "local"},
      {"label": "阿里云OSS", "value": "ali"},
      {"label": "腾讯云COS", "value": "tencent"}
    ]
  }
}
```
**组件**: `ElSelect`  
**特性**: 下拉单选，支持搜索、清空

---

### 10. selects - 下拉多选
```json
{
  "type": "selects",
  "key": "allowed_ips",
  "name": "允许的IP",
  "value": ["127.0.0.1", "192.168.1.1"],
  "options": {
    "options": [
      {"label": "本地", "value": "127.0.0.1"},
      {"label": "内网A", "value": "192.168.1.1"},
      {"label": "内网B", "value": "192.168.1.2"}
    ]
  }
}
```
**组件**: `ElSelect` (multiple)  
**特性**: 下拉多选，支持搜索、清空

---

### 11. remoteSelect - 远程单选
```json
{
  "type": "remoteSelect",
  "key": "admin_id",
  "name": "管理员",
  "value": "",
  "options": {
    "api": "/admin/user/search"
  }
}
```
**组件**: `ElSelect` (remote)  
**特性**: 远程搜索单选，需配置 api 接口

---

### 12. remoteSelects - 远程多选
```json
{
  "type": "remoteSelects",
  "key": "role_ids",
  "name": "关联角色",
  "value": [],
  "options": {
    "api": "/admin/role/search"
  }
}
```
**组件**: `ElSelect` (multiple + remote)  
**特性**: 远程搜索多选

---

### 13. city - 城市选择器
```json
{
  "type": "city",
  "key": "company_city",
  "name": "公司所在地",
  "value": []
}
```
**组件**: `ElCascader`  
**特性**: 省市区级联选择

---

## 📅 日期时间类（4种）

### 14. datetime - 日期时间选择器
```json
{
  "type": "datetime",
  "key": "publish_time",
  "name": "发布时间",
  "value": ""
}
```
**组件**: `ElDatePicker` (type="datetime")  
**格式**: `YYYY-MM-DD HH:mm:ss`

---

### 15. date - 日期选择器
```json
{
  "type": "date",
  "key": "start_date",
  "name": "开始日期",
  "value": ""
}
```
**组件**: `ElDatePicker` (type="date")  
**格式**: `YYYY-MM-DD`

---

### 16. year - 年份选择器
```json
{
  "type": "year",
  "key": "found_year",
  "name": "成立年份",
  "value": ""
}
```
**组件**: `ElDatePicker` (type="year")  
**格式**: `YYYY`

---

### 17. time - 时间选择器
```json
{
  "type": "time",
  "key": "work_time",
  "name": "工作时间",
  "value": ""
}
```
**组件**: `ElTimePicker`  
**格式**: `HH:mm:ss`

---

## 🎨 特殊类（5种）

### 18. color - 颜色选择器
```json
{
  "type": "color",
  "key": "theme_color",
  "name": "主题颜色",
  "value": "#409EFF"
}
```
**组件**: `ArtColorPicker` (自定义)  
**特性**: 颜色选择器 + 输入框，支持预定义颜色

---

### 19. icon - 图标选择器
```json
{
  "type": "icon",
  "key": "menu_icon",
  "name": "菜单图标",
  "value": "ri:home-line"
}
```
**组件**: `ArtIconSelector` (自定义)  
**特性**: 可视化图标选择 + 自定义输入

---

### 20. array - 数组编辑器
```json
{
  "type": "array",
  "key": "ip_whitelist",
  "name": "IP白名单",
  "value": "127.0.0.1,192.168.1.1",
  "remark": "多个值用逗号分隔"
}
```
**组件**: `ElInput` (type="textarea")  
**特性**: 数组数据输入，多个值用逗号分隔

---

### 21. editor - 富文本编辑器
```json
{
  "type": "editor",
  "key": "site_notice",
  "name": "站点公告",
  "value": "<p>欢迎使用</p>"
}
```
**组件**: `ArtWangEditor` (自定义)  
**特性**: 富文本编辑，支持图片、链接等

---

### 22. remoteSelect / remoteSelects - 远程搜索
见上文选择类说明

---

## 📁 文件上传类（4种）

### 23. image - 单图上传
```json
{
  "type": "image",
  "key": "site_logo",
  "name": "网站LOGO",
  "value": "",
  "options": {
    "maxSize": 5
  }
}
```
**组件**: `ArtImageUpload` (自定义)  
**特性**: 
- 单图上传
- 支持预览、删除
- 默认最大 5MB

---

### 24. images - 多图上传
```json
{
  "type": "images",
  "key": "carousel_images",
  "name": "轮播图",
  "value": "",
  "options": {
    "limit": 9,
    "maxSize": 5
  }
}
```
**组件**: `ArtImageUpload` (multiple)  
**特性**: 
- 多图上传
- 支持拖拽排序
- 支持预览、删除
- 默认最多 9 张

---

### 25. file - 单文件上传
```json
{
  "type": "file",
  "key": "contract_file",
  "name": "合同文件",
  "value": "",
  "options": {
    "accept": ".pdf,.doc,.docx",
    "maxSize": 10
  }
}
```
**组件**: `ArtFileUpload` (自定义)  
**特性**: 
- 单文件上传
- 支持文件类型限制
- 显示文件图标和大小
- 默认最大 10MB

---

### 26. files - 多文件上传
```json
{
  "type": "files",
  "key": "attachments",
  "name": "附件",
  "value": "",
  "options": {
    "limit": 10,
    "accept": "*",
    "maxSize": 10
  }
}
```
**组件**: `ArtFileUpload` (multiple)  
**特性**: 
- 多文件上传
- 支持文件类型限制
- 显示文件列表
- 默认最多 10 个文件

---

## 📊 组件统计

| 分类 | 数量 | 组件类型 |
|------|------|----------|
| **基础输入** | 5 | text, password, textarea, number, json |
| **选择类** | 8 | switch, checkbox, radio, select, selects, remoteSelect, remoteSelects, city |
| **日期时间** | 4 | datetime, date, year, time |
| **特殊类** | 5 | color, icon, array, editor |
| **文件上传** | 4 | image, images, file, files |
| **总计** | **26** | 全部支持 ✅ |

---

## 🎯 Options 配置说明

不同类型的组件支持不同的 options 配置：

### 数字类型 (number)
```json
{
  "options": {
    "min": 0,
    "max": 100,
    "step": 1
  }
}
```

### 选择类型 (select/radio/checkbox)
```json
{
  "options": {
    "options": [
      {"label": "显示文本", "value": "值"}
    ]
  }
}
```

### 文件上传类型 (image/file)
```json
{
  "options": {
    "maxSize": 5,  // MB
    "limit": 9,    // 最大数量（多文件）
    "accept": ".jpg,.png"  // 文件类型限制
  }
}
```

### 远程搜索类型 (remoteSelect/remoteSelects)
```json
{
  "options": {
    "api": "/admin/user/search"  // 远程搜索接口
  }
}
```

### 多行文本 (textarea)
```json
{
  "options": {
    "rows": 4  // 行数
  }
}
```

---

## 🔐 allow_del 删除控制

每个配置项都有 `allow_del` 字段：

- **0** - 核心配置，不允许删除（右键菜单禁用）
- **1** - 可选配置，允许删除

```sql
-- 设置为核心配置（不可删除）
UPDATE xy_sys_config SET allow_del = 0 WHERE `key` = 'site_name';

-- 设置为可删除
UPDATE xy_sys_config SET allow_del = 1 WHERE `key` = 'custom_field';
```

---

## 📌 使用建议

### 1. 基础信息配置
推荐使用: `text`, `textarea`, `image`, `color`

### 2. 账号密码配置
推荐使用: `text`, `password`, `number`

### 3. 开关配置
推荐使用: `switch`, `checkbox`

### 4. 选项配置
推荐使用: `select`, `radio` (选项固定)  
推荐使用: `remoteSelect`, `remoteSelects` (选项动态)

### 5. 时间配置
推荐使用: `datetime`, `date`, `time`, `year`

### 6. 富文本内容
推荐使用: `editor`

### 7. 文件资源
推荐使用: `image/images` (图片)  
推荐使用: `file/files` (文档/其他文件)

### 8. 复杂数据
推荐使用: `json`, `object`, `array`

---

## 🚀 快速示例

### 完整配置项示例

```sql
INSERT INTO `xy_sys_config` (
  `group`, `group_name`, `name`, `key`, `value`, `type`, 
  `options`, `rules`, `sort`, `remark`, `allow_del`
) VALUES 
-- 文本输入
('basics', '基础设置', '站点名称', 'site_name', 'XY-GO-Admin', 'text', NULL, NULL, 10, '网站名称', 0),

-- 颜色选择
('basics', '基础设置', '主题颜色', 'theme_color', '#409EFF', 'color', NULL, NULL, 60, '主题主色调，应用于按钮等元素', 1),

-- 图标选择
('basics', '基础设置', '站点图标', 'site_icon', 'ri:home-line', 'icon', NULL, NULL, 70, '网站图标', 1),

-- 单图上传
('basics', '基础设置', '站点LOGO', 'site_logo', '', 'image', '{"maxSize":5}', NULL, 80, '后台上传LOGO图片', 0),

-- 开关
('basics', '基础设置', '是否关闭站点', 'site_closed', '0', 'switch', NULL, NULL, 40, '1=关闭, 0=正常', 0),

-- 下拉选择
('basics', '基础设置', '站点时区', 'site_timezone', 'Asia/Shanghai', 'select', 
'{"options":[{"label":"上海","value":"Asia/Shanghai"},{"label":"香港","value":"Asia/Hong_Kong"}]}', 
NULL, 30, '影响时间显示方式', 0);
```

---

## 💡 开发提示

1. **组件自动注册**: 所有 `Art*` 组件通过 `unplugin-vue-components` 自动注册，无需手动导入
2. **类型提示**: TypeScript 类型定义自动生成在 `src/types/import/components.d.ts`
3. **扩展新类型**: 在配置页面的 `v-if/v-else-if` 链中添加新的组件类型判断即可
4. **样式定制**: 在 `.config-item-wrapper` 中使用 `:has()` 选择器针对不同组件调整样式

---

## 🎨 自定义组件

项目已封装的自定义表单组件：

1. **ArtColorPicker** - 颜色选择器
2. **ArtIconSelector** - 图标选择器
3. **ArtImageUpload** - 图片上传
4. **ArtFileUpload** - 文件上传
5. **ArtWangEditor** - 富文本编辑器

所有组件都支持 v-model 双向绑定和标准的 Element Plus 样式风格。
