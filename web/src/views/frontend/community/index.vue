<template>
  <main class="community-page px-6 pb-8 pt-12 overflow-x-hidden">
    <div class="max-w-7xl mx-auto">
      <!-- Hero banner with search -->
      <section class="bg-gradient-to-br from-blue-600 to-indigo-700 rounded-[48px] shadow-clay-deep p-10 md:p-16 mb-10 relative overflow-hidden">
        <div class="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-20 -mt-20"></div>
        <div class="absolute bottom-0 left-0 w-48 h-48 bg-blue-400/20 rounded-full blur-2xl -ml-10 -mb-10"></div>

        <div class="relative z-10 text-center max-w-2xl mx-auto">
          <h1 class="font-heading font-black text-4xl md:text-5xl text-white mb-6">社区问答</h1>
          <p class="text-blue-100 text-lg mb-8 font-medium">在这里，每一个问题都能得到有温度的解答</p>

          <div class="relative group">
            <div class="absolute inset-y-0 left-0 pl-6 flex items-center pointer-events-none">
              <ArtSvgIcon icon="ri:search-line" class="text-2xl text-blue-300 group-focus-within:text-blue-500 transition-colors" />
            </div>
            <input
              v-model="searchKeyword"
              type="text"
              placeholder="搜索帖子、回复内容..."
              class="w-full h-16 pl-16 pr-28 rounded-2xl bg-white/20 backdrop-blur-md border-2 border-white/30 focus:bg-white focus:border-white focus:ring-0 transition-all duration-300 font-bold text-lg text-gray-800 focus:text-gray-800 placeholder-blue-100 focus:placeholder-gray-400 shadow-lg outline-none"
              @keyup.enter="onSearch"
            />
            <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
              <button
                class="h-10 px-5 rounded-xl bg-white text-blue-600 font-black text-sm shadow-md hover:bg-blue-50 active:scale-95 transition-all"
                @click="onSearch"
              >
                搜索
              </button>
            </div>
          </div>

          <div class="mt-6 flex flex-wrap justify-center gap-3">
            <span class="text-blue-100 text-xs font-bold">常见问题：</span>
            <a
              v-for="tag in hotSearchTags"
              :key="tag"
              href="#"
              class="px-4 py-1.5 rounded-xl bg-white/10 hover:bg-white/20 border border-white/20 text-xs font-bold text-white transition-all"
              @click.prevent="onTagSearch(tag)"
            >
              {{ tag }}
            </a>
          </div>
        </div>
      </section>

      <!-- Main grid -->
      <div class="grid lg:grid-cols-12 gap-8 items-start">
        <!-- Left: question list (8 cols) -->
        <div class="lg:col-span-8 space-y-6">
          <!-- Filter tabs -->
          <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-6 flex flex-wrap items-center justify-between gap-4">
            <div class="flex items-center gap-2">
              <button
                v-for="tab in qaTabs"
                :key="tab"
                class="px-6 py-2.5 rounded-2xl font-bold text-sm transition-all duration-300"
                :class="activeTab === tab
                  ? 'bg-clay-accent text-white shadow-clay-btn'
                  : 'text-clay-muted hover:text-clay-accent hover:bg-white'"
                @click="activeTab = tab"
              >
                {{ tab }}
              </button>
            </div>
            <div class="flex items-center gap-4">
              <select class="bg-transparent border-0 font-bold text-sm text-clay-foreground focus:ring-0 cursor-pointer outline-none" @change="onCategoryChange(Number(($event.target as HTMLSelectElement).value))">
                <option :value="0">全部板块</option>
                <option v-for="cat in categories" :key="cat.id" :value="cat.id">{{ cat.title }}</option>
              </select>
            </div>
          </div>

          <!-- Question cards -->
          <div class="space-y-6">
            <div
              v-for="q in questions"
              :key="q.id"
              class="group bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8 hover:-translate-y-1 transition-all duration-500 relative overflow-hidden cursor-pointer"
              @click="goDetail(q.id)"
            >
              <!-- Pinned ribbon -->
              <div v-if="q.isTop" class="absolute top-0 right-0 w-24 h-24 overflow-hidden pointer-events-none">
                <div class="absolute top-4 right-[-30px] rotate-45 bg-gradient-to-r from-amber-400 to-orange-500 text-white text-[10px] font-black py-1 px-10 shadow-sm">
                  PINNED
                </div>
              </div>

              <div class="flex gap-6">
                <!-- Avatar -->
                <div class="hidden sm:block shrink-0">
                  <div class="w-14 h-14 rounded-2xl bg-white shadow-clay-btn p-1">
                    <div class="w-full h-full rounded-xl overflow-hidden bg-blue-100 flex items-center justify-center">
                      <img v-if="q.memberAvatar" :src="q.memberAvatar" class="w-full h-full object-cover" />
                      <ArtSvgIcon v-else icon="ri:user-3-fill" class="text-2xl text-blue-400" />
                    </div>
                  </div>
                </div>

                <div class="flex-1 min-w-0">
                  <!-- Tags + time -->
                  <div class="flex flex-wrap items-center gap-2 mb-3">
                    <span
                      v-for="tag in parseTags(q.tags)"
                      :key="tag"
                      class="px-3 py-1 rounded-lg text-[10px] font-black uppercase tracking-wider"
                      :class="tag === '公告' ? 'bg-amber-100 text-amber-600' : 'bg-blue-50 text-blue-500'"
                    >
                      {{ tag }}
                    </span>
                    <span v-if="q.isEssence" class="px-3 py-1 rounded-lg text-[10px] font-black uppercase tracking-wider bg-green-50 text-green-500">精华</span>
                    <span class="text-clay-muted text-xs font-bold ml-auto">{{ formatTime(q.createdAt) }}</span>
                  </div>

                  <!-- Title -->
                  <h3 class="text-xl font-heading font-extrabold text-clay-foreground mb-3 group-hover:text-clay-accent transition-colors leading-snug">
                    {{ q.title }}
                  </h3>

                  <!-- Excerpt -->
                  <p class="text-clay-muted text-sm leading-relaxed mb-6 line-clamp-2">
                    {{ q.categoryName }}
                  </p>

                  <!-- Meta -->
                  <div class="flex items-center justify-between">
                    <div class="flex items-center gap-4">
                      <div class="flex items-center gap-1.5 text-clay-muted">
                        <ArtSvgIcon icon="ri:chat-3-line" class="text-base" />
                        <span class="text-xs font-bold" :class="{ 'text-amber-500': q.replyCount === 0 }">{{ q.replyCount }} 回答</span>
                      </div>
                      <div class="flex items-center gap-1.5 text-clay-muted">
                        <ArtSvgIcon icon="ri:eye-line" class="text-base" />
                        <span class="text-xs font-bold">{{ q.views }} 浏览</span>
                      </div>
                      <div class="flex items-center gap-1.5 text-clay-muted">
                        <ArtSvgIcon icon="ri:thumb-up-line" class="text-base" />
                        <span class="text-xs font-bold">{{ q.likeCount }}</span>
                      </div>
                    </div>
                    <div class="flex items-center gap-2">
                      <span class="text-xs font-bold text-clay-foreground">{{ q.memberNickname }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Pagination -->
          <div v-if="totalCount > pageSize" class="flex justify-center pt-10">
            <div class="flex items-center gap-2 bg-white/70 backdrop-blur-xl p-2 rounded-2xl shadow-clay-card border border-[#d1d9e6]/40">
              <button class="w-10 h-10 rounded-xl flex items-center justify-center text-clay-muted hover:bg-blue-50 hover:text-clay-accent transition-all" @click="prevPage">
                <ArtSvgIcon icon="ri:arrow-left-s-line" class="text-xl" />
              </button>
              <button
                v-for="p in paginationPages"
                :key="p"
                class="w-10 h-10 rounded-xl flex items-center justify-center text-sm font-bold transition-all"
                :class="p === currentPage ? 'bg-clay-accent text-white shadow-clay-btn' : 'text-clay-muted hover:bg-blue-50 hover:text-clay-accent'"
                @click="goPage(p)"
              >
                {{ p }}
              </button>
              <button class="w-10 h-10 rounded-xl flex items-center justify-center text-clay-muted hover:bg-blue-50 hover:text-clay-accent transition-all" @click="nextPage">
                <ArtSvgIcon icon="ri:arrow-right-s-line" class="text-xl" />
              </button>
            </div>
          </div>
        </div>

        <!-- Right sidebar (4 cols) -->
        <aside class="lg:col-span-4 space-y-8">
          <!-- Ask question button -->
          <button class="w-full py-6 rounded-[32px] bg-gradient-to-br from-blue-400 to-blue-600 text-white font-heading font-black text-xl shadow-clay-btn hover:shadow-clay-btn-hover hover:-translate-y-1 active:scale-95 active:shadow-clay-pressed transition-all duration-300 flex items-center justify-center gap-3 group" @click="goPublish">
            <ArtSvgIcon icon="ri:edit-2-line" class="text-2xl group-hover:rotate-12 transition-transform" />
            我要提问
          </button>

          <!-- Daily check-in -->
          <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8">
            <div class="flex items-center justify-between mb-6">
              <h4 class="font-heading font-extrabold text-clay-foreground">每日签到</h4>
              <span v-if="checkin.continuousDays > 0" class="text-xs font-bold text-clay-muted">已连签 {{ checkin.continuousDays }} 天</span>
              <span v-else class="text-xs font-bold text-clay-muted">快来签到吧</span>
            </div>
            <!-- 7天日历格子 -->
            <div class="grid grid-cols-7 gap-2 mb-2">
              <div
                v-for="(day, i) in checkin.weekDays"
                :key="i"
                class="aspect-square rounded-xl flex flex-col items-center justify-center gap-0.5"
                :class="day.checked ? 'bg-clay-accent shadow-clay-btn' : 'bg-gray-100'"
                :title="day.date"
              >
                <ArtSvgIcon v-if="day.checked" icon="ri:check-line" class="text-sm text-white" />
                <span v-else class="text-[10px] font-bold text-gray-400">{{ new Date(day.date).getDate() }}</span>
              </div>
            </div>
            <!-- 星期标签 -->
            <div class="grid grid-cols-7 gap-2 mb-6">
              <div v-for="d in ['一','二','三','四','五','六','日']" :key="d" class="text-center text-[9px] font-bold text-gray-300">{{ d }}</div>
            </div>
            <!-- 今日积分提示 -->
            <p v-if="checkin.todayChecked && checkin.todayScore > 0" class="text-center text-xs text-green-500 font-bold mb-3">
              今日已获得 +{{ checkin.todayScore }} 积分
            </p>
            <!-- 签到按钮 -->
            <button
              class="w-full py-3 rounded-2xl font-bold text-sm transition-all active:scale-95"
              :class="checkin.todayChecked
                ? 'bg-gray-100 text-gray-400 cursor-default'
                : 'bg-white text-clay-accent shadow-clay-btn hover:shadow-clay-btn-hover'"
              :disabled="checkin.todayChecked || checkinLoading"
              @click="handleCheckin"
            >
              <span v-if="checkinLoading">签到中...</span>
              <span v-else-if="checkin.todayChecked">今日已签到 ✓</span>
              <span v-else>立即签到领取积分</span>
            </button>
          </div>

          <!-- Popular tags -->
          <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8">
            <h4 class="font-heading font-extrabold text-clay-foreground mb-6">热门标签</h4>
            <div class="flex flex-wrap gap-2">
              <a
                v-for="tag in popularTags"
                :key="tag.tag"
                href="#"
                class="px-4 py-2 rounded-xl bg-white border border-gray-100 text-xs font-bold text-clay-muted hover:text-clay-accent hover:border-clay-accent transition-all shadow-sm"
                @click.prevent="onTagSearch(tag.tag)"
              >
                # {{ tag.tag }}
              </a>
            </div>
          </div>

          <!-- Waiting questions -->
          <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8">
            <h4 class="font-heading font-extrabold text-clay-foreground mb-6">待解答</h4>
            <div class="space-y-4">
              <div v-for="item in waitingQuestions" :key="item.id" class="group cursor-pointer" @click="goDetail(item.id)">
                <p class="text-sm font-bold text-clay-foreground group-hover:text-clay-accent transition-colors line-clamp-1 mb-1">{{ item.title }}</p>
                <span class="text-[10px] font-bold text-clay-muted">{{ formatTime(item.createdAt) }}</span>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </main>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import {
  fetchCommunityCategoryList,
  fetchCommunityPostList,
  fetchCommunityHotTags,
  fetchCommunityHotSearchWords,
  fetchCommunityWaitingPosts,
  getCheckinInfo,
  doCheckin,
  type CheckinDayItem
} from '@/api/frontend'
import { useMemberStore } from '@/store/modules/member'
import { ElMessage } from 'element-plus'
defineOptions({ name: 'FrontendCommunity' })

const router = useRouter()
const searchKeyword = ref('')
const activeTab = ref('默认')
const currentPage = ref(1)
const pageSize = ref(10)
const totalCount = ref(0)
const activeCategoryId = ref(0) // 0=全部

const hotSearchTags = ref<string[]>([])
const qaTabs = ['默认', '刚刚活跃', '消灭零回答']
const categories = ref<{ id: number; title: string }[]>([])
const popularTags = ref<{ tag: string; count: number }[]>([])
const questions = ref<any[]>([])
const waitingQuestions = ref<any[]>([])

// 签到数据
const checkin = reactive({
  continuousDays: 0,
  todayChecked: false,
  todayScore: 0,
  weekDays: [] as CheckinDayItem[]
})
const checkinLoading = ref(false)

// 排序映射
const sortMap: Record<string, string> = {
  '默认': 'default',
  '刚刚活跃': 'active',
  '消灭零回答': 'unanswered'
}

// 解析 tags JSON 字符串
function parseTags(tags: string): string[] {
  if (!tags) return []
  try { return JSON.parse(tags) } catch { return [] }
}

// 时间格式化
function formatTime(ts: number): string {
  if (!ts) return ''
  const diff = Math.floor(Date.now() / 1000) - ts
  if (diff < 60) return '刚刚'
  if (diff < 3600) return `${Math.floor(diff / 60)}分钟前`
  if (diff < 86400) return `${Math.floor(diff / 3600)}小时前`
  if (diff < 604800) return `${Math.floor(diff / 86400)}天前`
  const d = new Date(ts * 1000)
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
}

// 计算分页页码
const paginationPages = computed(() => {
  const total = Math.ceil(totalCount.value / pageSize.value)
  if (total <= 7) return Array.from({ length: total }, (_, i) => i + 1)
  const pages: (number | string)[] = [1]
  if (currentPage.value > 3) pages.push('...')
  for (let i = Math.max(2, currentPage.value - 1); i <= Math.min(total - 1, currentPage.value + 1); i++) {
    pages.push(i)
  }
  if (currentPage.value < total - 2) pages.push('...')
  pages.push(total)
  return pages
})

// 加载帖子列表
async function loadPosts() {
  try {
    const params: any = {
      page: currentPage.value,
      pageSize: pageSize.value,
      sort: sortMap[activeTab.value] || 'default'
    }
    if (activeCategoryId.value > 0) params.categoryId = activeCategoryId.value
    if (searchKeyword.value.trim()) params.keyword = searchKeyword.value.trim()
    const res = await fetchCommunityPostList(params)
    questions.value = res?.list ?? []
    totalCount.value = res?.total ?? 0
  } catch (e) {
    console.error('加载帖子失败', e)
  }
}

// 加载分类
async function loadCategories() {
  try {
    const list = await fetchCommunityCategoryList()
    categories.value = list.map((c: any) => ({ id: c.id, title: c.title }))
  } catch (e) {
    console.error('加载分类失败', e)
  }
}

// 加载热门标签
async function loadHotTags() {
  try {
    const list = await fetchCommunityHotTags()
    popularTags.value = list
    // 热门搜索词优先，没有数据时降级用帖子标签
    try {
      const searchWords = await fetchCommunityHotSearchWords()
      if (searchWords.length > 0) {
        hotSearchTags.value = searchWords.slice(0, 4).map((t: any) => t.keyword)
      } else {
        hotSearchTags.value = list.slice(0, 4).map((t: any) => t.tag)
      }
    } catch {
      hotSearchTags.value = list.slice(0, 4).map((t: any) => t.tag)
    }
  } catch (e) {
    console.error('加载热门标签失败', e)
  }
}

// 加载待解答
async function loadWaiting() {
  try {
    const list = await fetchCommunityWaitingPosts()
    waitingQuestions.value = list
  } catch (e) {
    console.error('加载待解答失败', e)
  }
}

// 加载签到信息（仅登录状态下调用）
async function loadCheckinInfo() {
  if (!useMemberStore().isLogin) return
  try {
    const res = await getCheckinInfo()
    if (res) {
      checkin.continuousDays = res.continuousDays ?? 0
      checkin.todayChecked = res.todayChecked ?? false
      checkin.todayScore = res.todayScore ?? 0
      checkin.weekDays = res.weekDays ?? []
    }
  } catch {
    // 未登录时忽略错误，保持默认空状态
  }
}

// 执行签到
async function handleCheckin() {
  if (!useMemberStore().isLogin) {
    router.push({ path: '/user/login', query: { redirect: '/community' } })
    return
  }
  if (checkin.todayChecked || checkinLoading.value) return
  checkinLoading.value = true
  try {
    const res = await doCheckin()
    if (res) {
      checkin.todayChecked = true
      checkin.todayScore = res.score
      checkin.continuousDays = res.continuousDays
      ElMessage.success(`签到成功！获得 +${res.score} 积分，已连续签到 ${res.continuousDays} 天`)
      // 刷新日历
      await loadCheckinInfo()
    }
  } catch (e: any) {
    const msg = e?.message || e?.msg || '签到失败，请稍后重试'
    ElMessage.warning(msg)
  } finally {
    checkinLoading.value = false
  }
}

// Tab 切换
watch(activeTab, () => {
  currentPage.value = 1
  loadPosts()
})

// 分类切换
function onCategoryChange(catId: number) {
  activeCategoryId.value = catId
  currentPage.value = 1
  loadPosts()
}

// 搜索回车 → 跳转到搜索结果页
function onSearch() {
  const kw = searchKeyword.value.trim()
  if (!kw) return
  router.push({ path: '/community-search', query: { q: kw } })
}

// 分页
function goPage(p: number | string) {
  if (typeof p !== 'number') return
  currentPage.value = p
  loadPosts()
}
function prevPage() {
  if (currentPage.value > 1) { currentPage.value--; loadPosts() }
}
function nextPage() {
  const total = Math.ceil(totalCount.value / pageSize.value)
  if (currentPage.value < total) { currentPage.value++; loadPosts() }
}

// 跳转详情
function goDetail(id: number) {
  router.push(`/community/${id}`)
}

// 跳转发帖
function goPublish() {
  router.push('/community-publish')
}

// 热门标签搜索 → 跳转到搜索结果页
function onTagSearch(tag: string) {
  router.push({ path: '/community-search', query: { q: tag } })
}

// 初始化
onMounted(() => {
  loadCategories()
  loadPosts()
  loadHotTags()
  loadWaiting()
  loadCheckinInfo()
})
</script>

<style lang="scss" scoped>
.text-clay-foreground { color: #32325d; }
.text-clay-muted { color: #8898aa; }
.text-clay-accent { color: #5a8dee; }
.bg-clay-accent { background-color: #5a8dee; }
.font-heading { font-family: 'Nunito', 'PingFang SC', sans-serif; }

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
</style>
