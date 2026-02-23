<!-- 案例管理页面（卡片网格 + 分类筛选） -->
<template>
  <div class="page-content !mb-5">
    <!-- 顶部操作栏 -->
    <ElRow justify="space-between" :gutter="10">
      <ElCol :lg="5" :md="6" :sm="14" :xs="16">
        <ElInput
          v-model="searchVal"
          :prefix-icon="Search"
          clearable
          placeholder="输入案例标题查询"
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
      <ElCol :lg="5" :md="6" :sm="10" :xs="8" style="display: flex; justify-content: end">
        <ElButton type="primary" @click="handleAdd">新增案例</ElButton>
      </ElCol>
    </ElRow>

    <!-- 卡片网格 -->
    <div class="mt-5">
      <div
        v-if="caseList.length > 0"
        class="grid grid-cols-5 gap-5 max-2xl:grid-cols-4 max-xl:grid-cols-3 max-lg:grid-cols-2 max-sm:grid-cols-1"
      >
        <div
          class="group c-p overflow-hidden border border-g-300/60 rounded-custom-sm"
          v-for="item in caseList"
          :key="item.id"
          @click="handleEdit(item)"
        >
          <div class="relative aspect-[16/9.5]">
            <ElImage
              class="flex align-center justify-center w-full h-full object-cover bg-gray-200"
              :src="item.cover"
              lazy
              fit="cover"
            >
              <template #error>
                <div class="w-full h-full flex items-center justify-center bg-gray-100">
                  <ArtSvgIcon icon="ri:image-line" class="text-3xl text-gray-300" />
                </div>
              </template>
            </ElImage>

            <span class="absolute top-1 right-1 bg-black/50 rounded text-xs px-1 py-0.5 text-white">
              {{ item.categoryName || '未分类' }}
            </span>
            <span v-if="item.isTop" class="absolute top-1 left-1 bg-orange-500 rounded text-xs px-1 py-0.5 text-white">
              置顶
            </span>
          </div>
          <div class="px-2 py-1">
            <h2 class="text-base text-g-800 font-medium truncate">{{ item.title }}</h2>
            <div class="flex-b w-full h-6 mt-1">
              <div class="flex-c text-g-500">
                <ArtSvgIcon icon="ri:eye-line" class="mr-1 text-sm" />
                <span class="text-sm">{{ item.views }}</span>
                <div class="w-px h-3 bg-g-400 mx-3.5"></div>
                <ElTag :type="statusMap[item.status]?.type" size="small" round>
                  {{ statusMap[item.status]?.label }}
                </ElTag>
              </div>
              <div class="opacity-0 group-hover:opacity-100 flex items-center gap-1">
                <ElButton size="small" @click.stop="handleEdit(item)">编辑</ElButton>
                <ElPopconfirm title="确定删除该案例吗？" @confirm="handleDelete(item.id)">
                  <template #reference>
                    <ElButton size="small" type="danger" @click.stop>删除</ElButton>
                  </template>
                </ElPopconfirm>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 空状态 -->
      <div style="margin-top: 16vh" v-if="showEmpty">
        <ElEmpty description="暂无案例数据" />
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

    <!-- 案例编辑弹窗 -->
    <CaseDialog
      ref="dialogRef"
      :category-tree="categoryTree"
      @submit="handleSubmit"
    />

    <!-- 分类管理弹窗 -->
    <ElDialog v-model="categoryDialogVisible" title="管理案例分类" width="650px" align-center destroy-on-close>
      <div class="mb-4 flex justify-end">
        <ElButton type="primary" size="small" @click="handleAddCategory">添加分类</ElButton>
      </div>
      <ElTable :data="categoryFlatList" row-key="id" border size="small">
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

      <!-- 分类编辑内联表单 -->
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
  </div>
</template>

<script setup lang="ts">
  import { ref, reactive, computed, onMounted } from 'vue'
  import { Search, Plus } from '@element-plus/icons-vue'
  import { ElMessage } from 'element-plus'
  import type { FormInstance, FormRules } from 'element-plus'
  import { fetchCaseList, fetchCaseDetail, fetchSaveCase, fetchDeleteCase } from '@/api/backend/cms/case'
  import { fetchCaseCategoryList, fetchSaveCaseCategory, fetchDeleteCaseCategory } from '@/api/backend/cms/case-category'
  import CaseDialog from './modules/case-dialog.vue'

  defineOptions({ name: 'CmsCase' })

  const statusMap: Record<number, { label: string; type: 'success' | 'info' | 'danger' }> = {
    1: { label: '已发布', type: 'success' },
    2: { label: '草稿', type: 'info' },
    3: { label: '下架', type: 'danger' }
  }

  // ==================== 案例列表 ====================
  const loading = ref(false)
  const caseList = ref<any[]>([])
  const total = ref(0)
  const categoryTree = ref<any[]>([])
  const dialogRef = ref()

  const searchVal = ref('')
  const activeCategoryId = ref<number | string>('all')

  const searchForm = reactive({
    page: 1,
    pageSize: 40
  })

  const showEmpty = computed(() => caseList.value.length === 0 && !loading.value)

  // 分类选项（用于 Segmented）
  const categoryOptions = computed(() => {
    const opts: { label: string; value: number | string }[] = [{ label: '全部', value: 'all' }]
    const walk = (list: any[]) => {
      for (const item of list) {
        opts.push({ label: item.title, value: item.id })
        if (item.children?.length) walk(item.children)
      }
    }
    walk(categoryTree.value)
    return opts
  })

  // 分类平铺列表（用于管理弹窗表格）
  const categoryFlatList = computed(() => {
    const result: any[] = []
    const walk = (list: any[]) => {
      for (const item of list) {
        result.push(item)
        if (item.children?.length) walk(item.children)
      }
    }
    walk(categoryTree.value)
    return result
  })

  const loadCategoryTree = async () => {
    categoryTree.value = await fetchCaseCategoryList()
  }

  const loadData = async () => {
    loading.value = true
    try {
      const params: any = {
        page: searchForm.page,
        pageSize: searchForm.pageSize
      }
      if (searchVal.value) params.title = searchVal.value
      if (activeCategoryId.value !== 'all') params.categoryId = activeCategoryId.value
      const res = await fetchCaseList(params)
      caseList.value = res?.list ?? []
      total.value = res?.total ?? 0
    } finally {
      loading.value = false
    }
  }

  const handleSearch = () => {
    searchForm.page = 1
    loadData()
  }

  const handleCategoryChange = () => {
    searchForm.page = 1
    loadData()
  }

  const handlePageChange = (val: number) => {
    searchForm.page = val
    loadData()
  }

  const handleAdd = () => {
    dialogRef.value?.open('add')
  }

  const handleEdit = async (row: any) => {
    const detail = await fetchCaseDetail(row.id)
    dialogRef.value?.open('edit', { ...row, ...detail })
  }

  const handleSubmit = async (formData: any) => {
    await fetchSaveCase(formData)
    ElMessage.success('保存成功')
    loadData()
  }

  const handleDelete = async (id: number) => {
    await fetchDeleteCase(id)
    ElMessage.success('删除成功')
    loadData()
  }

  // ==================== 分类管理弹窗 ====================
  const categoryDialogVisible = ref(false)
  const categoryFormVisible = ref(false)
  const categoryFormRef = ref<FormInstance>()
  const categoryForm = reactive({
    id: undefined as number | undefined,
    title: '',
    icon: '',
    sort: 0,
    status: 1
  })
  const categoryRules: FormRules = {
    title: [{ required: true, message: '请输入分类名称', trigger: 'blur' }]
  }

  const openCategoryDialog = () => {
    categoryFormVisible.value = false
    categoryDialogVisible.value = true
    loadCategoryTree()
  }

  const handleAddCategory = () => {
    Object.assign(categoryForm, { id: undefined, title: '', icon: '', sort: 0, status: 1 })
    categoryFormVisible.value = true
  }

  const handleEditCategory = (row: any) => {
    Object.assign(categoryForm, { id: row.id, title: row.title, icon: row.icon, sort: row.sort, status: row.status })
    categoryFormVisible.value = true
  }

  const submitCategory = async () => {
    if (!categoryFormRef.value) return
    await categoryFormRef.value.validate(async (valid) => {
      if (valid) {
        await fetchSaveCaseCategory({ ...categoryForm })
        ElMessage.success('保存成功')
        categoryFormVisible.value = false
        await loadCategoryTree()
      }
    })
  }

  const handleDeleteCategory = async (id: number) => {
    await fetchDeleteCaseCategory(id)
    ElMessage.success('删除成功')
    await loadCategoryTree()
  }

  onMounted(() => {
    loadCategoryTree()
    loadData()
  })
</script>

<style lang="scss">
  .custom-segmented .el-segmented {
    height: 40px;
    padding: 6px;
    --el-border-radius-base: 8px;
  }
</style>
