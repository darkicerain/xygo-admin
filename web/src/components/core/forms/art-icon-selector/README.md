# ArtIconSelector 图标选择器组件

一个符合用户使用习惯的图标选择器组件，提供可视化的图标选择界面，类似于 BuildAdmin 的图标选择器。

## 功能特性

- 🎨 可视化图标选择界面
- 🔍 支持图标搜索功能
- 📂 图标分类展示（全部、Awesome、Ali、本地）
- ✨ 实时预览选中的图标
- ✏️ **支持自定义输入任意 Iconify 图标名称**
- 👀 自定义输入实时预览（小、中、大尺寸）
- 🧹 支持清空选择
- 🎯 点击选择，交互友好

## 基本用法

```vue
<template>
  <ArtIconSelector v-model="iconValue" />
</template>

<script setup lang="ts">
const iconValue = ref('ri:home-line')
</script>
```

## Props

| 参数 | 说明 | 类型 | 默认值 |
|------|------|------|--------|
| modelValue | 当前选中的图标值 | string | '' |
| clearable | 是否显示清空按钮 | boolean | true |

## Events

| 事件名 | 说明 | 回调参数 |
|--------|------|----------|
| update:modelValue | 图标值改变时触发 | (value: string) |
| change | 图标值改变时触发 | (value: string) |

## 示例

### 基础使用

```vue
<template>
  <ElFormItem label="图标">
    <ArtIconSelector v-model="form.icon" />
  </ElFormItem>
</template>

<script setup lang="ts">
const form = reactive({
  icon: 'ri:settings-3-line'
})
</script>
```

### 禁用清空按钮

```vue
<template>
  <ArtIconSelector v-model="iconValue" :clearable="false" />
</template>
```

### 监听变化

```vue
<template>
  <ArtIconSelector 
    v-model="iconValue" 
    @change="handleIconChange"
  />
</template>

<script setup lang="ts">
const iconValue = ref('')

const handleIconChange = (value: string) => {
  console.log('选中的图标:', value)
}
</script>
```

### 使用自定义图标

```vue
<template>
  <!-- 可以设置任何 Iconify 支持的图标 -->
  <ArtIconSelector v-model="customIcon" />
</template>

<script setup lang="ts">
// 支持所有 Iconify 图标库
const customIcon = ref('mdi:github') // Material Design Icons
// const customIcon = ref('fa-brands:twitter') // Font Awesome
// const customIcon = ref('heroicons:home') // Heroicons
// const customIcon = ref('tabler:user') // Tabler Icons
</script>
```

## 使用说明

### 快速选择模式

组件内置了 200+ 常用的 Remix Icon 图标，可以直接点击选择：

- 系统图标（home, dashboard, settings 等）
- 箭头图标
- 用户相关图标
- 文件图标
- 消息通知图标
- 状态图标
- 媒体图标
- 商业图标
- 工具图标
- 时间日期图标
- 社交图标
- 编辑器图标
- 地图导航图标
- 设备图标
- 网络图标

### 自定义输入模式

**不受内置图标限制！** 点击"自定义输入"按钮，可以手动输入任何 Iconify 支持的图标名称：

1. 点击"自定义输入"切换到输入模式
2. 在输入框中输入完整的图标名称（如：`ri:wechat-line`、`mdi:github`、`fa:home` 等）
3. 实时预览图标效果（显示小、中、大三种尺寸）
4. 点击确定即可使用

**支持的图标库：**
- Remix Icon（ri:）
- Material Design Icons（mdi:）
- Font Awesome（fa:、fa-solid:、fa-brands: 等）
- Tabler Icons（tabler:）
- Heroicons（heroicons:）
- 以及 Iconify 支持的所有图标库

访问 [Iconify 图标库](https://icon-sets.iconify.design/) 浏览和搜索所有可用图标。

## 样式定制

组件支持暗黑模式，会根据系统主题自动切换样式。所有颜色都使用 CSS 变量定义，可以通过修改主题变量来定制样式。

## 注意事项

1. 确保项目中已经安装并配置了 Iconify 图标库
2. 组件依赖 `ArtSvgIcon` 组件来渲染图标
3. 组件使用 Element Plus 的 Dialog、Input、ScrollBar 等组件
