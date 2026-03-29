<template>
  <ElDialog
    v-model="dialogVisible"
    :title="dialogType === 'add' ? '添加会员' : '编辑会员'"
    width="30%"
    align-center
  >
    <ElForm ref="formRef" :model="formData" :rules="rules" label-width="80px">
      <ElFormItem label="头像">
        <div class="flex-c gap-3">
          <ElAvatar :size="64" :src="formData.avatar || undefined">
            <span class="text-lg">{{ formData.username?.charAt(0) || '?' }}</span>
          </ElAvatar>
          <div>
            <ElButton size="small" @click="triggerAvatarUpload">上传头像</ElButton>
            <ElButton v-if="formData.avatar" size="small" type="danger" link @click="formData.avatar = ''">移除</ElButton>
            <input ref="avatarInput" type="file" accept="image/*" class="hidden" @change="handleAvatarUpload" />
          </div>
        </div>
      </ElFormItem>
      <ElFormItem label="用户名" prop="username">
        <ElInput v-model="formData.username" placeholder="请输入用户名" />
      </ElFormItem>
      <ElFormItem label="昵称" prop="nickname">
        <ElInput v-model="formData.nickname" placeholder="请输入昵称" />
      </ElFormItem>
      <ElFormItem label="手机号" prop="mobile">
        <ElInput v-model="formData.mobile" placeholder="请输入手机号" maxlength="11" />
      </ElFormItem>
      <ElFormItem label="邮箱" prop="email">
        <ElInput v-model="formData.email" placeholder="请输入邮箱" />
      </ElFormItem>
      <ElFormItem :label="dialogType === 'add' ? '密码' : '新密码'" prop="password">
        <ElInput v-model="formData.password" type="password" :placeholder="dialogType === 'add' ? '请输入密码' : '留空则不修改'" show-password />
      </ElFormItem>
      <ElFormItem label="性别" prop="gender">
        <ElSelect v-model="formData.gender">
          <ElOption label="男" :value="1" />
          <ElOption label="女" :value="2" />
          <ElOption label="未知" :value="0" />
        </ElSelect>
      </ElFormItem>
      <ElFormItem label="会员分组" prop="groupId">
        <ElSelect v-model="formData.groupId" placeholder="请选择会员分组">
          <ElOption v-for="group in groupOptions" :key="group.id" :label="group.name" :value="group.id" />
        </ElSelect>
      </ElFormItem>
      <ElFormItem label="积分" prop="score">
        <ElInputNumber v-model="formData.score" :min="0" />
      </ElFormItem>
      <ElFormItem label="余额" prop="money">
        <ElInputNumber v-model="formData.money" :min="0" :precision="2" />
      </ElFormItem>
      <ElFormItem label="状态" prop="status">
        <ElSwitch v-model="formData.status" :active-value="1" :inactive-value="0" />
      </ElFormItem>
    </ElForm>
    <template #footer>
      <div class="dialog-footer">
        <ElButton @click="dialogVisible = false">取消</ElButton>
        <ElButton type="primary" @click="handleSubmit">提交</ElButton>
      </div>
    </template>
  </ElDialog>
</template>

<script setup lang="ts">
  import type { FormInstance, FormRules } from 'element-plus'
  import { getMemberGroupOptions, addMember, editMember, type MemberItem, type MemberGroupOption } from '@/api/backend/member'
  import { uploadImageApi } from '@/api/backend/common/upload'

  interface Props {
    visible: boolean
    type: string
    memberData?: Partial<MemberItem>
  }

  interface Emits {
    (e: 'update:visible', value: boolean): void
    (e: 'submit', formData: any): void
  }

  const props = defineProps<Props>()
  const emit = defineEmits<Emits>()

  // 会员分组列表
  const groupOptions = ref<MemberGroupOption[]>([])

  // 对话框显示控制
  const dialogVisible = computed({
    get: () => props.visible,
    set: (value) => emit('update:visible', value)
  })

  const dialogType = computed(() => props.type)

  // 表单实例
  const formRef = ref<FormInstance>()
  const avatarInput = ref<HTMLInputElement | null>(null)

  const triggerAvatarUpload = () => {
    avatarInput.value?.click()
  }

  const handleAvatarUpload = async (e: Event) => {
    const target = e.target as HTMLInputElement
    const file = target.files?.[0]
    if (!file) return
    target.value = ''
    try {
      const res = await uploadImageApi(file) as any
      if (res?.url) {
        formData.avatar = res.url
        ElMessage.success('头像上传成功')
      }
    } catch {
      ElMessage.error('头像上传失败')
    }
  }

  // 表单数据
  const formData = reactive({
    id: 0,
    username: '',
    nickname: '',
    mobile: '',
    email: '',
    avatar: '',
    gender: 0,
    password: '',
    groupId: undefined as number | undefined,
    score: 0,
    money: 0,
    status: 1
  })

  // 表单验证规则（编辑时密码非必填）
  const rules = computed<FormRules>(() => ({
    username: [
      { required: true, message: '请输入用户名', trigger: 'blur' },
      { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
    ],
    nickname: [
      { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
    ],
    mobile: [
      { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号格式', trigger: 'blur' }
    ],
    email: [
      { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
    ],
    password: dialogType.value === 'add'
      ? [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, message: '密码至少6位', trigger: 'blur' }
        ]
      : [
          { min: 6, message: '密码至少6位', trigger: 'blur' }
        ]
  }))

  // 加载会员分组选项
  const loadGroupOptions = async () => {
    try {
      const res = await getMemberGroupOptions()
      groupOptions.value = res.list || []
    } catch (error) {
      console.error('Failed to load group options:', error)
    }
  }

  onMounted(() => {
    loadGroupOptions()
  })

  /**
   * 初始化表单数据
   */
  const initFormData = () => {
    const isEdit = props.type === 'edit' && props.memberData
    const row = props.memberData

    if (isEdit && row) {
      formData.id = row.id || 0
      formData.username = row.username || ''
      formData.nickname = row.nickname || ''
      formData.mobile = row.mobile || ''
      formData.email = row.email || ''
      formData.avatar = row.avatar || ''
      formData.gender = row.gender || 0
      formData.groupId = row.groupId
      formData.score = row.score || 0
      formData.money = row.money || 0
      formData.status = row.status || 1
      formData.password = ''
    } else {
      formData.id = 0
      formData.username = ''
      formData.nickname = ''
      formData.mobile = ''
      formData.email = ''
      formData.avatar = ''
      formData.gender = 0
      formData.password = ''
      formData.groupId = undefined
      formData.score = 0
      formData.money = 0
      formData.status = 1
    }
  }

  /**
   * 监听对话框状态变化
   */
  watch(
    () => [props.visible, props.type, props.memberData],
    ([visible]) => {
      if (visible) {
        initFormData()
        nextTick(() => {
          formRef.value?.clearValidate()
        })
      }
    },
    { immediate: true }
  )

  /**
   * 提交表单
   */
  const handleSubmit = async () => {
    if (!formRef.value) return

    await formRef.value.validate(async (valid) => {
      if (valid) {
        try {
          const submitData = { ...formData }
          if (submitData.id && !submitData.password) {
            delete (submitData as any).password
          }
          if (submitData.id) {
            await editMember(submitData)
          } else {
            await addMember(submitData)
          }
          ElMessage.success(formData.id ? '编辑成功' : '添加成功')
          dialogVisible.value = false
          emit('submit', { ...formData })
        } catch (error) {
          console.error('保存会员失败:', error)
        }
      }
    })
  }
</script>
