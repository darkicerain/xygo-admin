# ArtArrayEditor 多维数组编辑器

一个功能强大的多维数组编辑器组件，支持多种数据类型，可灵活配置字段，提供拖拽排序、动态增删等功能。

## 功能特性

- 🎯 支持多种字段类型（text, number, select, switch, date, color, icon等）
- 🎨 灵活的字段配置，支持自定义字段
- 🔄 拖拽排序功能
- ➕ 动态添加/删除行
- 📊 序号显示
- 🎭 支持分组展示
- 💾 实时数据更新
- 🌓 暗黑模式支持

## 基本用法

```vue
<template>
  <ArtArrayEditor 
    v-model="dataList" 
    :fields="fieldConfig"
    :show-index="true"
  />
</template>

<script setup lang="ts">
const dataList = ref([
  { name: '张三', role: 'admin', active: true },
  { name: '李四', role: 'user', active: false }
])

const fieldConfig = [
  {
    key: 'name',
    label: '姓名',
    type: 'text',
    placeholder: '请输入姓名'
  },
  {
    key: 'role',
    label: '角色',
    type: 'select',
    options: [
      { label: '管理员', value: 'admin' },
      { label: '用户', value: 'user' }
    ]
  },
  {
    key: 'active',
    label: '激活',
    type: 'switch'
  }
]
</script>
```

## Props

| 参数 | 说明 | 类型 | 默认值 |
|------|------|------|--------|
| modelValue | 数组数据 | any[] | [] |
| fields | 字段配置 | FieldConfig[] | [] |
| showIndex | 是否显示序号 | boolean | true |
| sortable | 是否支持拖拽排序 | boolean | true |
| groupable | 是否支持分组 | boolean | false |

## FieldConfig 字段配置

```typescript
interface FieldConfig {
  key: string                  // 字段键名（必填）
  label: string                // 字段标签（必填）
  type: string                 // 字段类型（必填）
  placeholder?: string         // 占位文本
  options?: Array<{           // 选择类型的选项
    label: string
    value: any
  }>
  min?: number                 // 数字类型的最小值
  max?: number                 // 数字类型的最大值
  default?: any                // 默认值
}
```

## 支持的字段类型

### 1. text / string - 文本输入
```javascript
{
  key: 'name',
  label: '姓名',
  type: 'text',
  placeholder: '请输入姓名'
}
```

### 2. number - 数字输入
```javascript
{
  key: 'age',
  label: '年龄',
  type: 'number',
  min: 0,
  max: 150,
  default: 18
}
```

### 3. select - 下拉单选
```javascript
{
  key: 'role',
  label: '角色',
  type: 'select',
  options: [
    { label: '管理员', value: 'admin' },
    { label: '用户', value: 'user' }
  ]
}
```

### 4. selects - 下拉多选
```javascript
{
  key: 'tags',
  label: '标签',
  type: 'selects',
  options: [
    { label: 'Vue', value: 'vue' },
    { label: 'React', value: 'react' }
  ]
}
```

### 5. switch - 开关
```javascript
{
  key: 'enabled',
  label: '启用',
  type: 'switch',
  default: true
}
```

### 6. date - 日期选择
```javascript
{
  key: 'birthday',
  label: '生日',
  type: 'date'
}
```

### 7. color - 颜色选择
```javascript
{
  key: 'themeColor',
  label: '主题色',
  type: 'color',
  default: '#409EFF'
}
```

### 8. icon - 图标选择
```javascript
{
  key: 'icon',
  label: '图标',
  type: 'icon',
  default: 'ri:home-line'
}
```

## 使用场景

### 1. 用户列表管理
```vue
<ArtArrayEditor 
  v-model="users" 
  :fields="[
    { key: 'name', label: '姓名', type: 'text' },
    { key: 'email', label: '邮箱', type: 'text' },
    { key: 'role', label: '角色', type: 'select', options: [...] },
    { key: 'active', label: '激活', type: 'switch' }
  ]"
/>
```

### 2. 菜单配置
```vue
<ArtArrayEditor 
  v-model="menus" 
  :fields="[
    { key: 'title', label: '标题', type: 'text' },
    { key: 'icon', label: '图标', type: 'icon' },
    { key: 'path', label: '路径', type: 'text' },
    { key: 'sort', label: '排序', type: 'number' }
  ]"
/>
```

### 3. 权限配置
```vue
<ArtArrayEditor 
  v-model="permissions" 
  :fields="[
    { key: 'module', label: '模块', type: 'select', options: [...] },
    { key: 'action', label: '操作', type: 'select', options: [...] },
    { key: 'enabled', label: '启用', type: 'switch' }
  ]"
/>
```

### 4. 配置项列表
```vue
<ArtArrayEditor 
  v-model="configs" 
  :fields="[
    { key: 'key', label: '键名', type: 'text' },
    { key: 'value', label: '值', type: 'text' },
    { key: 'type', label: '类型', type: 'select', options: [...] }
  ]"
/>
```

## Events

| 事件名 | 说明 | 回调参数 |
|--------|------|----------|
| update:modelValue | 数据改变时触发 | (value: any[]) |
| change | 数据改变时触发 | (value: any[]) |

## 在系统配置中使用

### 配置示例

```json
{
  "type": "array",
  "key": "user_roles",
  "name": "用户角色配置",
  "value": [...],
  "options": {
    "fields": [
      {
        "key": "name",
        "label": "角色名称",
        "type": "text"
      },
      {
        "key": "permissions",
        "label": "权限",
        "type": "selects",
        "options": [...]
      }
    ],
    "showIndex": true,
    "sortable": true
  }
}
```

### 在配置页面中的渲染

组件会自动根据 `type="array"` 和 `options.fields` 配置来渲染数组编辑器。

## 数据格式

### 输入数据
```javascript
[
  { name: '张三', role: 'admin', tags: ['vue', 'react'] },
  { name: '李四', role: 'user', tags: ['angular'] }
]
```

### 输出数据
完全相同的数据结构，支持双向绑定。

### 存储到数据库
数组数据会被 JSON 序列化为字符串存储：
```json
"[{\"name\":\"张三\",\"role\":\"admin\",\"tags\":[\"vue\",\"react\"]},{\"name\":\"李四\",\"role\":\"user\",\"tags\":[\"angular\"]}]"
```

## 高级功能

### 1. 自定义默认值
```javascript
{
  key: 'status',
  label: '状态',
  type: 'select',
  default: 'active',  // 新增行时的默认值
  options: [...]
}
```

### 2. 数字范围限制
```javascript
{
  key: 'age',
  label: '年龄',
  type: 'number',
  min: 0,
  max: 150
}
```

### 3. 选项配置
```javascript
{
  key: 'category',
  label: '分类',
  type: 'select',
  options: [
    { label: '技术', value: 'tech' },
    { label: '生活', value: 'life' },
    { label: '娱乐', value: 'entertainment' }
  ]
}
```

## 样式定制

组件使用 CSS 变量，可以通过修改变量来定制样式：

```scss
.art-array-editor {
  --editor-border-color: var(--art-gray-300);
  --editor-bg-color: var(--default-box-color);
  --editor-hover-color: var(--theme-color);
}
```

## 注意事项

1. **数据结构一致性**: 所有行的字段应该保持一致
2. **键名唯一性**: 每个字段的 key 必须唯一
3. **类型安全**: 确保字段类型与数据类型匹配
4. **性能考虑**: 大数据量时建议分页或虚拟滚动

## 完整示例

查看示例页面：`/widgets/array-editor`

包含以下场景的完整示例：
- 用户列表管理
- 权限配置
- 菜单配置
- 标签配置
- 参数配置

## 扩展建议

未来可以考虑添加：
- [ ] 批量导入/导出（Excel、JSON）
- [ ] 字段验证规则
- [ ] 条件显示字段
- [ ] 嵌套数组支持
- [ ] 虚拟滚动（大数据量）
- [ ] 搜索和过滤
- [ ] 批量编辑
- [ ] 历史记录/撤销重做
