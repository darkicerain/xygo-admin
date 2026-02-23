<template>
  <ElDialog
    v-model="dialogVisible"
    :title="dialogType === 'add' ? '新增案例' : '编辑案例'"
    width="90%"
    top="3vh"
    align-center
    :close-on-click-modal="false"
    destroy-on-close
  >
    <ElForm ref="formRef" :model="formData" :rules="rules" label-width="90px">
      <ElRow :gutter="20">
        <ElCol :span="12">
          <ElFormItem label="案例标题" prop="title">
            <ElInput v-model="formData.title" placeholder="请输入案例标题" />
          </ElFormItem>
        </ElCol>
        <ElCol :span="12">
          <ElFormItem label="所属分类" prop="categoryId">
            <ElTreeSelect
              v-model="formData.categoryId"
              :data="categoryTree"
              :props="{ label: 'title', value: 'id', children: 'children' }"
              placeholder="请选择分类"
              check-strictly
              style="width: 100%"
            />
          </ElFormItem>
        </ElCol>
      </ElRow>
      <ElRow :gutter="20">
        <ElCol :span="12">
          <ElFormItem label="封面图" prop="cover">
            <ElInput v-model="formData.cover" placeholder="请输入封面图URL" />
          </ElFormItem>
        </ElCol>
        <ElCol :span="12">
          <ElFormItem label="外部链接">
            <ElInput v-model="formData.link" placeholder="案例外部链接（可选）" />
          </ElFormItem>
        </ElCol>
      </ElRow>
      <ElRow :gutter="20">
        <ElCol :span="4">
          <ElFormItem label="排序">
            <ElInputNumber v-model="formData.sort" :min="0" controls-position="right" style="width: 100%" />
          </ElFormItem>
        </ElCol>
        <ElCol :span="4">
          <ElFormItem label="状态">
            <ElSelect v-model="formData.status" style="width: 100%">
              <ElOption label="已发布" :value="1" />
              <ElOption label="草稿" :value="2" />
              <ElOption label="下架" :value="3" />
            </ElSelect>
          </ElFormItem>
        </ElCol>
        <ElCol :span="4">
          <ElFormItem label="置顶">
            <ElSwitch v-model="formData.isTop" :active-value="1" :inactive-value="0" />
          </ElFormItem>
        </ElCol>
        <ElCol :span="12">
          <ElFormItem label="标签">
            <ElInput v-model="formData.tags" placeholder='["标签1"]' />
          </ElFormItem>
        </ElCol>
      </ElRow>
      <ElRow :gutter="20">
        <ElCol :span="24">
          <ElFormItem label="摘要">
            <ElInput v-model="formData.summary" type="textarea" :rows="2" placeholder="请输入摘要" />
          </ElFormItem>
        </ElCol>
      </ElRow>
      <ElFormItem label="案例详情" prop="content">
        <div style="width: 100%; border: 1px solid var(--el-border-color); border-radius: 4px;">
          <MdEditor
            v-model="formData.content"
            :style="{ height: '500px' }"
            :preview="true"
            :toolbarsExclude="['github', 'prettier', 'mermaid', 'katex']"
            :noPrettier="true"
            :noMermaid="true"
            :noKatex="true"
            @onUploadImg="handleUploadImg"
          />
        </div>
      </ElFormItem>
    </ElForm>
    <template #footer>
      <ElButton @click="dialogVisible = false">取消</ElButton>
      <ElButton type="primary" @click="handleSubmit" :loading="submitting">保存</ElButton>
    </template>
  </ElDialog>
</template>

<script setup lang="ts">
  import { ref, reactive } from 'vue'
  import type { FormInstance, FormRules } from 'element-plus'
  import { MdEditor } from 'md-editor-v3'
  import 'md-editor-v3/lib/style.css'
  import { adminRequest } from '@/utils/http'

  defineProps<{ categoryTree: any[] }>()
  const emit = defineEmits<{ submit: [data: any] }>()

  const dialogVisible = ref(false)
  const dialogType = ref<'add' | 'edit'>('add')
  const submitting = ref(false)
  const formRef = ref<FormInstance>()

  const defaultForm = () => ({
    id: undefined as number | undefined,
    categoryId: undefined as number | undefined,
    title: '',
    cover: '',
    summary: '',
    content: '',
    link: '',
    sort: 0,
    status: 1,
    isTop: 0,
    tags: ''
  })

  const formData = reactive(defaultForm())

  const rules: FormRules = {
    title: [{ required: true, message: '请输入案例标题', trigger: 'blur' }],
    categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }]
  }

  const handleUploadImg = async (files: File[], callback: (urls: string[]) => void) => {
    const urls: string[] = []
    for (const file of files) {
      const fd = new FormData()
      fd.append('file', file)
      try {
        const res = await adminRequest.post<any>({
          url: '/upload/file',
          params: fd,
          headers: { 'Content-Type': 'multipart/form-data' }
        })
        if (res?.url) urls.push(res.url)
      } catch (e) {
        console.error('upload failed', e)
      }
    }
    callback(urls)
  }

  const open = (type: 'add' | 'edit', data?: any) => {
    dialogType.value = type
    Object.assign(formData, defaultForm(), data || {})
    dialogVisible.value = true
    formRef.value?.clearValidate()
  }

  const handleSubmit = async () => {
    if (!formRef.value) return
    await formRef.value.validate(async (valid) => {
      if (valid) {
        submitting.value = true
        try {
          emit('submit', { ...formData })
          dialogVisible.value = false
        } finally {
          submitting.value = false
        }
      }
    })
  }

  defineExpose({ open })
</script>
