<template>
  <main class="cases-page px-6 pb-8 pt-12 overflow-x-hidden">
    <!-- Hero Section -->
    <header class="relative pt-12 pb-16 lg:pt-20 lg:pb-24 text-center">
      <div class="max-w-4xl mx-auto relative z-10">
        <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/50 backdrop-blur-sm border border-white/50 shadow-sm mb-6 animate-float">
          <span class="w-2 h-2 rounded-full bg-clay-warning"></span>
          <span class="text-sm font-bold text-clay-muted uppercase tracking-wider">Inspiration</span>
        </div>

        <h1 class="font-heading font-black text-5xl sm:text-6xl lg:text-7xl leading-[1.1] mb-6 text-clay-foreground">
          客户<span class="clay-text-gradient">成功案例</span>
        </h1>

        <p class="text-lg sm:text-xl text-clay-muted mb-8 leading-relaxed max-w-2xl mx-auto">
          看看领先的企业和开发者如何使用 XYGo Admin 构建令人惊叹的现代化应用。
        </p>
      </div>
    </header>

    <!-- Filter & Grid -->
    <section class="max-w-7xl mx-auto">
      <!-- Filter buttons -->
      <div class="flex flex-wrap justify-center gap-4 mb-16">
        <button
          class="px-6 py-2.5 rounded-2xl font-bold text-sm transition-all duration-300"
          :class="!activeCategoryId
            ? 'bg-gradient-to-br from-blue-400 to-blue-600 text-white shadow-clay-btn'
            : 'bg-white text-clay-muted shadow-clay-card hover:shadow-clay-card-hover hover:text-clay-foreground'"
          @click="filterByCategory(0)"
        >
          全部
        </button>
        <button
          v-for="cat in flatCategories"
          :key="cat.id"
          class="px-6 py-2.5 rounded-2xl font-bold text-sm transition-all duration-300"
          :class="activeCategoryId === cat.id
            ? 'bg-gradient-to-br from-blue-400 to-blue-600 text-white shadow-clay-btn'
            : 'bg-white text-clay-muted shadow-clay-card hover:shadow-clay-card-hover hover:text-clay-foreground'"
          @click="filterByCategory(cat.id)"
        >
          {{ cat.title }}
        </button>
      </div>

      <!-- Loading -->
      <div v-if="loading" class="text-center py-20">
        <div class="inline-flex items-center gap-2 text-clay-muted text-sm font-bold">
          <ArtSvgIcon icon="ri:loader-4-line" class="text-lg animate-spin" />
          加载中...
        </div>
      </div>

      <!-- Case grid -->
      <div v-else-if="caseList.length > 0" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div
          v-for="item in caseList"
          :key="item.id"
          class="group relative rounded-[32px] bg-white/70 p-6 shadow-clay-card backdrop-blur-xl transition-all duration-500 hover:-translate-y-2 hover:shadow-clay-card-hover border border-[#d1d9e6]/40 flex flex-col h-full cursor-pointer"
          @click="openCase(item)"
        >
          <!-- Cover / Gradient area -->
          <div class="relative h-48 rounded-[24px] overflow-hidden mb-6 shadow-clay-pressed group-hover:shadow-none transition-shadow duration-500">
            <img
              v-if="item.cover"
              :src="item.cover"
              :alt="item.title"
              class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
            />
            <div v-else class="absolute inset-0 bg-gradient-to-br from-blue-400 to-indigo-600 opacity-80 transition-transform duration-700 group-hover:scale-110"></div>
            <div v-if="!item.cover" class="absolute inset-0 flex items-center justify-center">
              <ArtSvgIcon icon="ri:image-line" class="text-6xl text-white drop-shadow-lg" />
            </div>
            <div v-if="item.isTop" class="absolute top-4 left-4 bg-gradient-to-br from-amber-400 to-orange-500 text-white px-3 py-1 rounded-full text-xs font-bold shadow-sm">
              置顶
            </div>
            <div class="absolute top-4 right-4 bg-white/90 backdrop-blur px-3 py-1 rounded-full text-xs font-bold text-clay-foreground shadow-sm">
              {{ item.categoryName || '未分类' }}
            </div>
          </div>

          <!-- Content -->
          <div class="flex-1 flex flex-col">
            <h3 class="font-heading font-bold text-2xl text-clay-foreground mb-3 group-hover:text-clay-accent transition-colors">
              {{ item.title }}
            </h3>
            <p class="text-clay-muted text-sm leading-relaxed mb-6 flex-1 line-clamp-3">
              {{ item.summary }}
            </p>

            <!-- Tags -->
            <div v-if="parseTags(item.tags).length" class="flex flex-wrap gap-2 mb-6">
              <span
                v-for="tag in parseTags(item.tags)"
                :key="tag"
                class="px-2.5 py-1 rounded-lg bg-white/50 border border-white/50 text-xs font-bold text-clay-muted"
              >
                {{ tag }}
              </span>
            </div>

            <!-- Action -->
            <button
              class="w-full py-3 rounded-2xl bg-white shadow-clay-btn hover:shadow-clay-btn-hover text-clay-accent font-bold text-center transition-all active:scale-95 flex items-center justify-center gap-2"
              @click.stop="openCase(item)"
            >
              查看详情
              <ArtSvgIcon icon="ri:arrow-right-line" class="text-base" />
            </button>
          </div>
        </div>
      </div>

      <!-- Empty -->
      <div v-else class="text-center py-20">
        <ArtSvgIcon icon="ri:folder-open-line" class="text-5xl text-clay-muted mb-4 mx-auto" />
        <p class="text-clay-muted text-sm font-bold">暂无案例</p>
      </div>

      <!-- Pagination -->
      <div v-if="total > pageSize" class="flex justify-center mt-12">
        <div class="flex items-center gap-2 bg-white/70 backdrop-blur-xl p-2 rounded-2xl shadow-clay-card border border-[#d1d9e6]/40">
          <button class="w-10 h-10 rounded-xl flex items-center justify-center text-clay-muted hover:bg-blue-50 hover:text-clay-accent transition-all" @click="changePage(page - 1)">
            <ArtSvgIcon icon="ri:arrow-left-s-line" class="text-xl" />
          </button>
          <button
            v-for="p in paginationPages"
            :key="p"
            class="w-10 h-10 rounded-xl flex items-center justify-center text-sm font-bold transition-all"
            :class="p === page ? 'bg-clay-accent text-white shadow-clay-btn' : 'text-clay-muted hover:bg-blue-50 hover:text-clay-accent'"
            @click="goPage(p)"
          >
            {{ p }}
          </button>
          <button class="w-10 h-10 rounded-xl flex items-center justify-center text-clay-muted hover:bg-blue-50 hover:text-clay-accent transition-all" @click="changePage(page + 1)">
            <ArtSvgIcon icon="ri:arrow-right-s-line" class="text-xl" />
          </button>
        </div>
      </div>
    </section>

    <!-- 案例详情弹窗 -->
    <Teleport to="body">
      <Transition name="case-fade">
        <div v-if="detailVisible" class="detail-overlay" @mousedown.self="detailVisible = false">
          <div class="detail-dialog">
            <div class="detail-header">
              <h2 class="font-heading font-black text-xl text-clay-foreground flex-1">{{ detailData?.title }}</h2>
              <button class="w-8 h-8 rounded-lg flex items-center justify-center hover:bg-[#f0f3f8] transition-colors" @click="detailVisible = false">
                <ArtSvgIcon icon="ri:close-line" class="text-lg text-clay-muted" />
              </button>
            </div>
            <div class="detail-body">
              <div v-if="detailLoading" class="text-center py-16">
                <ArtSvgIcon icon="ri:loader-4-line" class="text-2xl text-clay-muted animate-spin" />
              </div>
              <template v-else-if="detailData">
                <div class="flex flex-wrap items-center gap-4 mb-6 text-xs font-bold text-clay-muted">
                  <span v-if="detailData.categoryName" class="px-2 py-0.5 rounded-full bg-blue-50 text-blue-500">{{ detailData.categoryName }}</span>
                  <span v-if="detailData.views" class="flex items-center gap-1">
                    <ArtSvgIcon icon="ri:eye-line" class="text-sm" /> {{ detailData.views }} 次浏览
                  </span>
                  <a v-if="detailData.link" :href="detailData.link" target="_blank" class="flex items-center gap-1 text-blue-500 hover:underline">
                    <ArtSvgIcon icon="ri:external-link-line" class="text-sm" /> 访问链接
                  </a>
                </div>
                <div class="doc-markdown-body">
                  <MdPreview
                    :model-value="detailData.content || ''"
                    :editor-id="'case-preview'"
                    preview-theme="github"
                    code-theme="atom"
                    :noMermaid="true"
                    :noKatex="true"
                  />
                </div>
              </template>
            </div>
          </div>
        </div>
      </Transition>
    </Teleport>
  </main>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { MdPreview } from 'md-editor-v3'
import 'md-editor-v3/lib/preview.css'
import { fetchCaseCategoryTree, fetchCaseListBySite, fetchCaseDetailBySite } from '@/api/frontend/case'

defineOptions({ name: 'FrontendCases' })

const loading = ref(false)
const categories = ref<any[]>([])
const caseList = ref<any[]>([])
const total = ref(0)
const page = ref(1)
const pageSize = 12
const activeCategoryId = ref<number>(0)

// 详情弹窗
const detailVisible = ref(false)
const detailLoading = ref(false)
const detailData = ref<any>(null)

const totalPages = computed(() => Math.ceil(total.value / pageSize) || 1)

const paginationPages = computed(() => {
  const tp = totalPages.value
  if (tp <= 7) return Array.from({ length: tp }, (_, i) => i + 1)
  const pages: (number | string)[] = [1]
  if (page.value > 3) pages.push('...')
  for (let i = Math.max(2, page.value - 1); i <= Math.min(tp - 1, page.value + 1); i++) {
    pages.push(i)
  }
  if (page.value < tp - 2) pages.push('...')
  pages.push(tp)
  return pages
})

function goPage(p: number | string) {
  if (typeof p !== 'number') return
  changePage(p)
}

// 将树形分类拍平为一维
const flatCategories = computed(() => {
  const result: any[] = []
  const walk = (list: any[]) => {
    for (const item of list) {
      result.push(item)
      if (item.children?.length) walk(item.children)
    }
  }
  walk(categories.value)
  return result
})

// 解析 tags JSON 字符串
function parseTags(tags: string): string[] {
  if (!tags) return []
  try { return JSON.parse(tags) } catch { return [] }
}

async function loadCategories() {
  try {
    categories.value = await fetchCaseCategoryTree()
  } catch (e) {
    console.error('加载分类失败', e)
  }
}

async function loadCases() {
  loading.value = true
  try {
    const params: any = { page: page.value, pageSize }
    if (activeCategoryId.value) params.categoryId = activeCategoryId.value
    const res = await fetchCaseListBySite(params)
    caseList.value = res?.list ?? []
    total.value = res?.total ?? 0
  } catch (e) {
    console.error('加载案例失败', e)
    caseList.value = []
  } finally {
    loading.value = false
  }
}

function filterByCategory(id: number) {
  activeCategoryId.value = id
  page.value = 1
  loadCases()
}

function changePage(p: number) {
  if (p < 1 || p > totalPages.value) return
  page.value = p
  loadCases()
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

async function openCase(item: any) {
  detailVisible.value = true
  detailLoading.value = true
  detailData.value = null
  try {
    detailData.value = await fetchCaseDetailBySite(item.id)
  } catch (e) {
    console.error('加载案例详情失败', e)
  } finally {
    detailLoading.value = false
  }
}

onMounted(() => {
  loadCategories()
  loadCases()
})
</script>

<style lang="scss" scoped>
.text-clay-foreground { color: #32325d; }
.text-clay-muted { color: #8898aa; }
.text-clay-accent { color: #5a8dee; }
.bg-clay-accent { background-color: #5a8dee; }
.bg-clay-warning { background-color: #ffab00; }
.font-heading { font-family: 'Nunito', 'PingFang SC', sans-serif; }

.clay-text-gradient {
  background: linear-gradient(135deg, #32325d 20%, #5a8dee 60%, #03c3ec 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.shadow-clay-deep {
  box-shadow: 30px 30px 60px #d1d9e6, -30px -30px 60px #ffffff,
    inset 10px 10px 20px rgba(90, 141, 238, 0.05), inset -10px -10px 20px rgba(255, 255, 255, 0.8);
}
.shadow-clay-card {
  box-shadow: 16px 16px 32px rgba(165, 175, 190, 0.3), -10px -10px 24px rgba(255, 255, 255, 0.9),
    inset 6px 6px 12px rgba(90, 141, 238, 0.03), inset -6px -6px 12px rgba(255, 255, 255, 1);
}
.shadow-clay-card-hover {
  box-shadow: 20px 20px 40px rgba(165, 175, 190, 0.35), -12px -12px 30px rgba(255, 255, 255, 0.95),
    inset 6px 6px 12px rgba(90, 141, 238, 0.03), inset -6px -6px 12px rgba(255, 255, 255, 1);
}
.shadow-clay-btn {
  box-shadow: 12px 12px 24px rgba(90, 141, 238, 0.3), -8px -8px 16px rgba(255, 255, 255, 0.4),
    inset 4px 4px 8px rgba(255, 255, 255, 0.4), inset -4px -4px 8px rgba(0, 0, 0, 0.05);
}
.shadow-clay-btn-hover {
  box-shadow: 16px 16px 32px rgba(90, 141, 238, 0.4), -10px -10px 20px rgba(255, 255, 255, 0.5),
    inset 4px 4px 8px rgba(255, 255, 255, 0.4), inset -4px -4px 8px rgba(0, 0, 0, 0.05);
}
.shadow-clay-pressed {
  box-shadow: inset 10px 10px 20px #e0e5ec, inset -10px -10px 20px #ffffff;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-20px); }
}
.animate-float { animation: float 8s ease-in-out infinite; }

/* Markdown 内容 */
.doc-markdown-body {
  :deep(.md-editor) { background: transparent; }
  :deep(.md-editor-preview-wrapper) { padding: 0; }
  :deep(.md-editor-preview) {
    font-size: 15px;
    line-height: 1.8;
    color: #32325d;

    h1, h2, h3, h4 { font-family: 'Nunito', 'PingFang SC', sans-serif; font-weight: 800; color: #32325d; }
    a { color: #5a8dee; &:hover { text-decoration: underline; } }
    code:not([class*="language-"]) { background: #f0f3f8; padding: 2px 6px; border-radius: 6px; font-size: 0.9em; color: #e74c3c; }
    pre { border-radius: 12px; overflow-x: auto; }
    img { border-radius: 12px; max-width: 100%; }
  }
}

/* 详情弹窗 */
.detail-overlay {
  position: fixed;
  inset: 0;
  z-index: 9999;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding-top: 5vh;
  background: rgba(50, 50, 93, 0.35);
  backdrop-filter: blur(4px);
}

.detail-dialog {
  width: 100%;
  max-width: 900px;
  max-height: 90vh;
  margin: 0 16px;
  background: white;
  border-radius: 24px;
  box-shadow: 0 25px 60px rgba(50, 50, 93, 0.25), 0 10px 20px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.detail-header {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 20px 24px;
  border-bottom: 1px solid #eef2f7;
}

.detail-body {
  flex: 1;
  overflow-y: auto;
  padding: 24px;
  scrollbar-width: thin;
  scrollbar-color: rgba(165, 175, 190, 0.3) transparent;
}

/* 弹窗动画 */
.case-fade-enter-active { transition: opacity 0.2s ease; .detail-dialog { transition: transform 0.2s ease, opacity 0.2s ease; } }
.case-fade-leave-active { transition: opacity 0.15s ease; .detail-dialog { transition: transform 0.15s ease, opacity 0.15s ease; } }
.case-fade-enter-from { opacity: 0; .detail-dialog { transform: scale(0.96) translateY(-8px); opacity: 0; } }
.case-fade-leave-to { opacity: 0; .detail-dialog { transform: scale(0.96) translateY(-8px); opacity: 0; } }
</style>
