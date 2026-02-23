<!-- 后台社区管理页面（卡片网格 + 分类管理弹窗） -->
<template>
  <div class="page-content !mb-5">
    <!-- 顶部操作栏 -->
    <ElRow justify="space-between" :gutter="10">
      <ElCol :lg="5" :md="6" :sm="14" :xs="16">
        <ElInput
          v-model="searchVal"
          :prefix-icon="Search"
          clearable
          placeholder="搜索帖子标题"
          @keyup.enter="handleSearch"
        />
      </ElCol>
      <ElCol :lg="14" :md="12" :sm="0" :xs="0">
        <div class="flex items-center gap-3">
          <div class="custom-segmented flex-1">
            <ElSegmented v-model="activeCategoryId" :options="categoryOptions" @change="handleCategoryChange" />
          </div>
          <ElButton @click="openCategoryDialog" :icon="Plus">管理分类</ElButton>
        </div>
      </ElCol>
      <ElCol :lg="5" :md="6" :sm="10" :xs="8" style="display: flex; justify-content: end; gap: 8px">
        <ElSelect v-model="statusFilter" style="width: 100px" @change="handleSearch">
          <ElOption label="全部" :value="-1" />
          <ElOption label="正常" :value="1" />
          <ElOption label="待审核" :value="2" />
          <ElOption label="隐藏" :value="3" />
        </ElSelect>
      </ElCol>
    </ElRow>

    <!-- 卡片网格 -->
    <div class="mt-5">
      <div
        v-if="postList.length > 0"
        class="grid grid-cols-4 gap-5 max-2xl:grid-cols-3 max-xl:grid-cols-2 max-lg:grid-cols-1"
      >
        <div
          class="group overflow-hidden border border-g-300/60 rounded-custom-sm"
          v-for="item in postList"
          :key="item.id"
        >
          <!-- 帖子头部 -->
          <div class="px-4 pt-4 pb-2">
            <div class="flex items-center gap-2 mb-2">
              <ElAvatar :size="28" :src="item.memberAvatar">
                <span class="text-xs">{{ (item.memberNickname || '匿名')[0] }}</span>
              </ElAvatar>
              <span class="text-sm font-medium text-g-700 truncate">{{ item.memberNickname || '匿名' }}</span>
              <span class="text-xs text-g-400 ml-auto">{{ formatTime(item.createdAt) }}</span>
            </div>
            <h3 class="text-base font-medium text-g-800 line-clamp-2 leading-snug mb-2">{{ item.title }}</h3>
            <!-- 标签 -->
            <div class="flex flex-wrap gap-1 mb-2" v-if="parseTags(item.tags).length">
              <ElTag v-for="tag in parseTags(item.tags)" :key="tag" size="small" type="info" round>{{ tag }}</ElTag>
            </div>
          </div>

          <!-- 底部统计 + 操作 -->
          <div class="px-4 pb-3 flex items-center justify-between">
            <div class="flex items-center gap-3 text-xs text-g-500">
              <span class="flex items-center gap-0.5">
                <ArtSvgIcon icon="ri:eye-line" class="text-sm" /> {{ item.views }}
              </span>
              <span class="flex items-center gap-0.5">
                <ArtSvgIcon icon="ri:chat-3-line" class="text-sm" /> {{ item.replyCount }}
              </span>
              <span class="flex items-center gap-0.5">
                <ArtSvgIcon icon="ri:thumb-up-line" class="text-sm" /> {{ item.likeCount }}
              </span>
              <ElTag v-if="item.isTop" type="warning" size="small" round>置顶</ElTag>
              <ElTag v-if="item.isEssence" type="success" size="small" round>精华</ElTag>
              <ElTag :type="statusMap[item.status]?.type" size="small" round>{{ statusMap[item.status]?.label }}</ElTag>
            </div>
            <div class="opacity-0 group-hover:opacity-100 flex items-center gap-1 transition-opacity">
              <ElDropdown trigger="click" @command="(cmd: string) => handleCommand(cmd, item)">
                <ElButton size="small" circle>
                  <ArtSvgIcon icon="ri:more-2-fill" class="text-sm" />
                </ElButton>
                <template #dropdown>
                  <ElDropdownMenu>
                    <ElDropdownItem :command="item.isTop ? 'unTop' : 'top'">
                      {{ item.isTop ? '取消置顶' : '置顶' }}
                    </ElDropdownItem>
                    <ElDropdownItem :command="item.isEssence ? 'unEssence' : 'essence'">
                      {{ item.isEssence ? '取消精华' : '精华' }}
                    </ElDropdownItem>
                    <ElDropdownItem v-if="item.status !== 1" command="show">显示</ElDropdownItem>
                    <ElDropdownItem v-if="item.status === 1" command="hide">隐藏</ElDropdownItem>
                    <ElDropdownItem command="replies">查看回复</ElDropdownItem>
                    <ElDropdownItem command="delete" divided>
                      <span class="text-red-500">删除</span>
                    </ElDropdownItem>
                  </ElDropdownMenu>
                </template>
              </ElDropdown>
            </div>
          </div>
        </div>
      </div>

      <div style="margin-top: 16vh" v-if="showEmpty">
        <ElEmpty description="暂无帖子数据" />
      </div>
    </div>

    <!-- 分页 -->
    <div class="flex justify-center mt-6 mb-2">
      <ElPagination
        size="default"
        background
        v-model:current-page="searchForm.page"
        :page-size="searchForm.pageSize"
        :pager-count="9"
        layout="prev, pager, next"
        :total="total"
        :hide-on-single-page="true"
        @current-change="handlePageChange"
      />
    </div>

    <!-- 分类管理弹窗 -->
    <ElDialog v-model="categoryDialogVisible" title="管理社区分类" width="600px" align-center destroy-on-close>
      <div class="mb-4 flex justify-end">
        <ElButton type="primary" size="small" @click="handleAddCategory">添加分类</ElButton>
      </div>
      <ElTable :data="categoryList" row-key="id" border size="small">
        <ElTableColumn prop="title" label="分类名称" min-width="120" />
        <ElTableColumn prop="icon" label="图标" width="60" align="center">
          <template #default="{ row }">
            <ArtSvgIcon v-if="row.icon" :icon="row.icon" :size="16" />
            <span v-else>-</span>
          </template>
        </ElTableColumn>
        <ElTableColumn prop="sort" label="排序" width="60" align="center" />
        <ElTableColumn prop="status" label="状态" width="70" align="center">
          <template #default="{ row }">
            <ElTag :type="row.status === 1 ? 'success' : 'danger'" size="small">
              {{ row.status === 1 ? '正常' : '禁用' }}
            </ElTag>
          </template>
        </ElTableColumn>
        <ElTableColumn label="操作" width="120" align="center">
          <template #default="{ row }">
            <ElButton link type="primary" size="small" @click="handleEditCategory(row)">编辑</ElButton>
            <ElPopconfirm title="确定删除该分类吗？" @confirm="handleDeleteCategory(row.id)">
              <template #reference>
                <ElButton link type="danger" size="small">删除</ElButton>
              </template>
            </ElPopconfirm>
          </template>
        </ElTableColumn>
      </ElTable>

      <div v-if="categoryFormVisible" class="mt-4 p-4 border border-g-300/60 rounded-lg">
        <ElForm ref="categoryFormRef" :model="categoryForm" :rules="categoryRules" label-width="80px" size="small">
          <ElRow :gutter="12">
            <ElCol :span="12">
              <ElFormItem label="分类名称" prop="title">
                <ElInput v-model="categoryForm.title" placeholder="请输入分类名称" />
              </ElFormItem>
            </ElCol>
            <ElCol :span="12">
              <ElFormItem label="图标">
                <ElInput v-model="categoryForm.icon" placeholder="如 ri:folder-line" />
              </ElFormItem>
            </ElCol>
          </ElRow>
          <ElRow :gutter="12">
            <ElCol :span="8">
              <ElFormItem label="排序">
                <ElInputNumber v-model="categoryForm.sort" :min="0" controls-position="right" style="width: 100%" />
              </ElFormItem>
            </ElCol>
            <ElCol :span="8">
              <ElFormItem label="状态">
                <ElSwitch v-model="categoryForm.status" :active-value="1" :inactive-value="2" />
              </ElFormItem>
            </ElCol>
            <ElCol :span="8">
              <ElFormItem>
                <ElButton type="primary" @click="submitCategory">保存</ElButton>
                <ElButton @click="categoryFormVisible = false">取消</ElButton>
              </ElFormItem>
            </ElCol>
          </ElRow>
        </ElForm>
      </div>
    </ElDialog>

    <!-- 回复列表弹窗 -->
    <ElDialog v-model="replyDialogVisible" :title="`帖子回复 (${replyTotal}条)`" width="700px" align-center destroy-on-close>
      <div v-if="replyList.length > 0" class="space-y-4 max-h-[60vh] overflow-y-auto">
        <div v-for="reply in replyList" :key="reply.id" class="border border-g-200 rounded-lg p-4">
          <div class="flex items-center gap-2 mb-2">
            <ElAvatar :size="24" :src="reply.memberAvatar">
              <span class="text-xs">{{ (reply.memberNickname || '匿名')[0] }}</span>
            </ElAvatar>
            <span class="text-sm font-medium">{{ reply.memberNickname || '匿名' }}</span>
            <ElTag v-if="reply.isAccepted" type="success" size="small">已采纳</ElTag>
            <span class="text-xs text-g-400 ml-auto">{{ formatTime(reply.createdAt) }}</span>
          </div>
          <div class="text-sm text-g-700 whitespace-pre-wrap">{{ reply.content }}</div>
          <div class="flex items-center justify-between mt-2">
            <span class="text-xs text-g-400">
              <ArtSvgIcon icon="ri:thumb-up-line" class="text-xs" /> {{ reply.likeCount }}
            </span>
            <ElPopconfirm title="确定删除该回复吗？" @confirm="handleDeleteReply(reply.id)">
              <template #reference>
                <ElButton link type="danger" size="small">删除</ElButton>
              </template>
            </ElPopconfirm>
          </div>
          <!-- 子回复 -->
          <div v-if="reply.children?.length" class="mt-3 pl-6 space-y-3 border-l-2 border-g-200">
            <div v-for="child in reply.children" :key="child.id" class="p-2">
              <div class="flex items-center gap-2 mb-1">
                <span class="text-xs font-medium text-g-600">{{ child.memberNickname || '匿名' }}</span>
                <span class="text-xs text-g-400">{{ formatTime(child.createdAt) }}</span>
              </div>
              <div class="text-sm text-g-600">{{ child.content }}</div>
              <div class="flex justify-end mt-1">
                <ElPopconfirm title="确定删除该回复吗？" @confirm="handleDeleteReply(child.id)">
                  <template #reference>
                    <ElButton link type="danger" size="small">删除</ElButton>
                  </template>
                </ElPopconfirm>
              </div>
            </div>
          </div>
        </div>
      </div>
      <ElEmpty v-else description="暂无回复" />
    </ElDialog>
  </div>
</template>

<script setup lang="ts">
  import { ref, reactive, computed, onMounted } from 'vue'
  import { Search, Plus } from '@element-plus/icons-vue'
  import { ElMessage, ElMessageBox } from 'element-plus'
  import type { FormInstance, FormRules } from 'element-plus'
  import {
    fetchCommunityCategoryList,
    fetchSaveCommunityCategory,
    fetchDeleteCommunityCategory,
    fetchCommunityPostList,
    fetchUpdateCommunityPost,
    fetchDeleteCommunityPost,
    fetchCommunityReplyList,
    fetchDeleteCommunityReply
  } from '@/api/backend/cms/community'

  defineOptions({ name: 'CmsCommunity' })

  const statusMap: Record<number, { label: string; type: 'success' | 'info' | 'danger' | 'warning' }> = {
    1: { label: '正常', type: 'success' },
    2: { label: '待审核', type: 'warning' },
    3: { label: '隐藏', type: 'info' }
  }

  // ==================== 帖子列表 ====================
  const postList = ref<any[]>([])
  const total = ref(0)
  const categoryList = ref<any[]>([])
  const searchVal = ref('')
  const activeCategoryId = ref<number | string>('all')
  const statusFilter = ref(-1)
  const searchForm = reactive({ page: 1, pageSize: 40 })

  const showEmpty = computed(() => postList.value.length === 0)

  const categoryOptions = computed(() => {
    const opts: { label: string; value: number | string }[] = [{ label: '全部', value: 'all' }]
    for (const c of categoryList.value) {
      opts.push({ label: c.title, value: c.id })
    }
    return opts
  })

  function parseTags(tags: string): string[] {
    if (!tags) return []
    try { return JSON.parse(tags) } catch { return [] }
  }

  function formatTime(ts: number): string {
    if (!ts) return ''
    const d = new Date(ts * 1000)
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')} ${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}`
  }

  const loadCategories = async () => {
    categoryList.value = await fetchCommunityCategoryList()
  }

  const loadData = async () => {
    const params: any = { page: searchForm.page, pageSize: searchForm.pageSize }
    if (searchVal.value) params.keyword = searchVal.value
    if (activeCategoryId.value !== 'all') params.categoryId = activeCategoryId.value
    if (statusFilter.value >= 0) params.status = statusFilter.value
    const res = await fetchCommunityPostList(params)
    postList.value = res?.list ?? []
    total.value = res?.total ?? 0
  }

  const handleSearch = () => { searchForm.page = 1; loadData() }
  const handleCategoryChange = () => { searchForm.page = 1; loadData() }
  const handlePageChange = (val: number) => { searchForm.page = val; loadData() }

  const handleCommand = async (cmd: string, item: any) => {
    switch (cmd) {
      case 'top':
        await fetchUpdateCommunityPost({ id: item.id, isTop: 1 }); ElMessage.success('已置顶'); loadData(); break
      case 'unTop':
        await fetchUpdateCommunityPost({ id: item.id, isTop: 0 }); ElMessage.success('已取消置顶'); loadData(); break
      case 'essence':
        await fetchUpdateCommunityPost({ id: item.id, isEssence: 1 }); ElMessage.success('已设为精华'); loadData(); break
      case 'unEssence':
        await fetchUpdateCommunityPost({ id: item.id, isEssence: 0 }); ElMessage.success('已取消精华'); loadData(); break
      case 'show':
        await fetchUpdateCommunityPost({ id: item.id, status: 1 }); ElMessage.success('已显示'); loadData(); break
      case 'hide':
        await fetchUpdateCommunityPost({ id: item.id, status: 3 }); ElMessage.success('已隐藏'); loadData(); break
      case 'replies':
        openReplyDialog(item.id); break
      case 'delete':
        await ElMessageBox.confirm('确定删除该帖子吗？', '提示', { type: 'warning' })
        await fetchDeleteCommunityPost(item.id); ElMessage.success('删除成功'); loadData(); break
    }
  }

  // ==================== 分类管理弹窗 ====================
  const categoryDialogVisible = ref(false)
  const categoryFormVisible = ref(false)
  const categoryFormRef = ref<FormInstance>()
  const categoryForm = reactive({ id: undefined as number | undefined, title: '', icon: '', sort: 0, status: 1 })
  const categoryRules: FormRules = { title: [{ required: true, message: '请输入分类名称', trigger: 'blur' }] }

  const openCategoryDialog = () => { categoryFormVisible.value = false; categoryDialogVisible.value = true; loadCategories() }
  const handleAddCategory = () => { Object.assign(categoryForm, { id: undefined, title: '', icon: '', sort: 0, status: 1 }); categoryFormVisible.value = true }
  const handleEditCategory = (row: any) => { Object.assign(categoryForm, { id: row.id, title: row.title, icon: row.icon, sort: row.sort, status: row.status }); categoryFormVisible.value = true }

  const submitCategory = async () => {
    if (!categoryFormRef.value) return
    await categoryFormRef.value.validate(async (valid) => {
      if (valid) {
        await fetchSaveCommunityCategory({ ...categoryForm })
        ElMessage.success('保存成功')
        categoryFormVisible.value = false
        await loadCategories()
      }
    })
  }

  const handleDeleteCategory = async (id: number) => {
    await fetchDeleteCommunityCategory(id)
    ElMessage.success('删除成功')
    await loadCategories()
  }

  // ==================== 回复弹窗 ====================
  const replyDialogVisible = ref(false)
  const replyList = ref<any[]>([])
  const replyTotal = ref(0)
  const currentPostId = ref(0)

  const openReplyDialog = async (postId: number) => {
    currentPostId.value = postId
    replyDialogVisible.value = true
    const res = await fetchCommunityReplyList({ postId, page: 1, pageSize: 100 })
    replyList.value = res?.list ?? []
    replyTotal.value = res?.total ?? 0
  }

  const handleDeleteReply = async (id: number) => {
    await fetchDeleteCommunityReply(id)
    ElMessage.success('删除成功')
    openReplyDialog(currentPostId.value)
  }

  onMounted(() => { loadCategories(); loadData() })
</script>

<style lang="scss">
  .custom-segmented .el-segmented {
    height: 40px;
    padding: 6px;
    --el-border-radius-base: 8px;
  }
</style>
