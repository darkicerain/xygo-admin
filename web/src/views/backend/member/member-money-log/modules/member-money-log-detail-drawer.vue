<!-- 余额变动日志 详情抽屉 -->
<template>
  <ElDrawer
    v-model="visible"
    title="余额变动日志详情"
    size="600px"
    :destroy-on-close="true"
  >
    <div v-if="loading" class="flex justify-center py-10">
      <ElIcon class="is-loading" :size="24"><Loading /></ElIcon>
    </div>
    <ElDescriptions v-else-if="detail" :column="1" border>
      <ElDescriptionsItem label="Id">{{ detail.id ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="会员ID">{{ detail.memberId ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="变动金额">{{ detail.money ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="变动前余额（分）">{{ detail.before ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="变动后余额（分）">{{ detail.after ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="变动说明">{{ detail.memo ?? '-' }}</ElDescriptionsItem>
      <ElDescriptionsItem label="创建时间">{{ formatTimestamp(detail.createdAt) }}</ElDescriptionsItem>
    </ElDescriptions>
  </ElDrawer>
</template>

<script setup lang="ts">
  import { Loading } from '@element-plus/icons-vue'
  import { fetchMemberMoneyLogView } from '@/api/backend/member/member-money-log'
  import { formatTimestamp } from '@/utils/time'

  const visible = defineModel<boolean>({ default: false })

  interface Props {
    viewId?: number
  }

  const props = defineProps<Props>()

  const loading = ref(false)
  const detail = ref<Record<string, any> | null>(null)

  watch(visible, async (val) => {
    if (val && props.viewId) {
      loading.value = true
      try {
        detail.value = await fetchMemberMoneyLogView(props.viewId) as any
      } catch { detail.value = null }
      loading.value = false
    }
  })
</script>
