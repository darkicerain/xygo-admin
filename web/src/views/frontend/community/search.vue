<template>
  <main class="community-page px-6 pb-8 pt-12 overflow-x-hidden">
    <div class="max-w-4xl mx-auto">

      <!-- 面包屑 -->
      <nav class="flex items-center gap-2 text-sm font-bold text-clay-muted mb-8">
        <router-link to="/" class="hover:text-clay-accent transition-colors">首页</router-link>
        <ArtSvgIcon icon="ri:arrow-right-s-line" class="text-base" />
        <router-link to="/community" class="hover:text-clay-accent transition-colors">社区问答</router-link>
        <ArtSvgIcon icon="ri:arrow-right-s-line" class="text-base" />
        <span class="text-clay-foreground">搜索结果</span>
      </nav>

      <!-- 搜索框 -->
      <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-6 mb-8">
        <div class="flex gap-3">
          <div class="relative flex-1">
            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
              <ArtSvgIcon icon="ri:search-line" class="text-xl text-clay-muted" />
            </div>
            <input
              v-model="keyword"
              type="text"
              placeholder="搜索帖子、回复内容..."
              class="w-full h-12 pl-12 pr-4 rounded-2xl border border-gray-200 text-sm font-medium focus:border-clay-accent focus:ring-0 outline-none transition-colors"
              @keyup.enter="doSearch"
            />
          </div>
          <button
            class="px-6 h-12 rounded-2xl bg-clay-accent text-white font-bold text-sm shadow-clay-btn hover:shadow-clay-btn-hover active:scale-95 transition-all"
            @click="doSearch"
          >
            搜索
          </button>
        </div>

        <!-- 热门搜索词 -->
        <div v-if="hotWords.length" class="mt-4 flex flex-wrap items-center gap-2">
          <span class="text-xs font-bold text-clay-muted">热门搜索：</span>
          <button
            v-for="w in hotWords"
            :key="w.keyword"
            class="px-3 py-1 rounded-xl bg-blue-50 text-xs font-bold text-blue-500 hover:bg-blue-100 transition-all"
            @click="onHotWord(w.keyword)"
          >
            {{ w.keyword }}
          </button>
        </div>
      </div>

      <!-- 搜索中 -->
      <div v-if="loading" class="text-center py-20">
        <ArtSvgIcon icon="ri:loader-4-line" class="text-3xl text-clay-muted animate-spin mx-auto" />
        <p class="text-clay-muted text-sm font-bold mt-3">搜索中...</p>
      </div>

      <!-- 无结果 -->
      <div v-else-if="!loading && searched && results.length === 0" class="text-center py-20">
        <ArtSvgIcon icon="ri:search-eye-line" class="text-5xl text-clay-muted mx-auto mb-4" />
        <p class="text-clay-foreground font-bold text-lg mb-2">没有找到相关内容</p>
        <p class="text-clay-muted text-sm">换个关键词试试，或者
          <router-link to="/community-publish" class="text-clay-accent hover:underline">发布一个新问题</router-link>
        </p>
      </div>

      <!-- 结果列表 -->
      <template v-else-if="results.length">
        <div class="flex items-center justify-between mb-4">
          <p class="text-sm font-bold text-clay-muted">
            找到 <span class="text-clay-accent">{{ total }}</span> 条结果
            <span v-if="keyword">，关键词：<span class="text-clay-foreground">{{ keyword }}</span></span>
          </p>
        </div>

        <div class="space-y-4">
          <div
            v-for="item in results"
            :key="item.postId + item.matchType"
            class="group bg-white/70 backdrop-blur-xl rounded-[28px] shadow-clay-card border border-[#d1d9e6]/40 p-6 hover:-translate-y-0.5 transition-all duration-300 cursor-pointer"
            @click="goDetail(item.postId)"
          >
            <!-- 命中类型标签 -->
            <div class="flex items-center gap-2 mb-3">
              <span
                class="px-2.5 py-1 rounded-lg text-[10px] font-black uppercase tracking-wider"
                :class="item.matchType === 'post' ? 'bg-blue-50 text-blue-500' : 'bg-purple-50 text-purple-500'"
              >
                {{ item.matchType === 'post' ? '帖子' : '回复命中' }}
              </span>
              <span class="px-2.5 py-1 rounded-lg text-[10px] font-bold bg-gray-50 text-clay-muted">
                {{ item.categoryName }}
              </span>
              <span class="text-[10px] font-bold text-clay-muted ml-auto">{{ formatTime(item.createdAt) }}</span>
            </div>

            <!-- 标题（含高亮） -->
            <h3
              class="text-lg font-heading font-extrabold text-clay-foreground mb-2 group-hover:text-clay-accent transition-colors leading-snug"
              v-html="item.postTitle"
            ></h3>

            <!-- 帖子摘要 -->
            <p
              class="text-clay-muted text-sm leading-relaxed mb-3 line-clamp-2 search-excerpt"
              v-html="item.postExcerpt"
            ></p>

            <!-- 回复命中摘要 -->
            <div v-if="item.matchType === 'reply' && item.replyExcerpt" class="bg-purple-50/60 rounded-xl px-4 py-2.5 mb-3 border-l-4 border-purple-300">
              <p class="text-xs font-bold text-purple-400 mb-1">回复内容命中：</p>
              <p class="text-sm text-clay-muted leading-relaxed search-excerpt" v-html="item.replyExcerpt"></p>
            </div>

            <!-- 底部 meta -->
            <div class="flex items-center gap-4">
              <div class="flex items-center gap-1.5 text-clay-muted">
                <div class="w-5 h-5 rounded-lg overflow-hidden bg-blue-100 flex items-center justify-center">
                  <img v-if="item.memberAvatar" :src="item.memberAvatar" class="w-full h-full object-cover" />
                  <ArtSvgIcon v-else icon="ri:user-3-fill" class="text-xs text-blue-400" />
                </div>
                <span class="text-xs font-bold">{{ item.memberNickname }}</span>
              </div>
              <div class="flex items-center gap-1 text-clay-muted">
                <ArtSvgIcon icon="ri:chat-3-line" class="text-sm" />
                <span class="text-xs font-bold">{{ item.replyCount }}</span>
              </div>
              <div class="flex items-center gap-1 text-clay-muted">
                <ArtSvgIcon icon="ri:eye-line" class="text-sm" />
                <span class="text-xs font-bold">{{ item.views }}</span>
              </div>
            </div>
          </div>
        </div>

        <!-- 分页 -->
        <div v-if="total > pageSize" class="flex justify-center mt-10">
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
      </template>

    </div>
  </main>
</template>

<script setup lang="ts">
import { useRouter, useRoute } from 'vue-router'
import { fetchCommunitySearch, fetchCommunityHotSearchWords } from '@/api/frontend'

defineOptions({ name: 'CommunitySearch' })

const router = useRouter()
const route = useRoute()

const keyword = ref((route.query.q as string) || '')
const page = ref(1)
const pageSize = 15
const total = ref(0)
const loading = ref(false)
const searched = ref(false)
const results = ref<any[]>([])
const hotWords = ref<any[]>([])

const totalPages = computed(() => Math.ceil(total.value / pageSize) || 1)
const paginationPages = computed(() => {
  const tp = totalPages.value
  if (tp <= 7) return Array.from({ length: tp }, (_, i) => i + 1)
  const pages: (number | string)[] = [1]
  if (page.value > 3) pages.push('...')
  for (let i = Math.max(2, page.value - 1); i <= Math.min(tp - 1, page.value + 1); i++) pages.push(i)
  if (page.value < tp - 2) pages.push('...')
  pages.push(tp)
  return pages
})

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

async function doSearch() {
  const kw = keyword.value.trim()
  if (!kw) return
  // 更新 URL query
  router.replace({ path: '/community-search', query: { q: kw } })
  loading.value = true
  searched.value = true
  page.value = 1
  try {
    const res = await fetchCommunitySearch({ keyword: kw, page: 1, pageSize })
    results.value = (res as any)?.list ?? []
    total.value = (res as any)?.total ?? 0
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

async function changePage(p: number) {
  if (p < 1 || p > totalPages.value) return
  page.value = p
  loading.value = true
  try {
    const res = await fetchCommunitySearch({ keyword: keyword.value.trim(), page: p, pageSize })
    results.value = (res as any)?.list ?? []
    total.value = (res as any)?.total ?? 0
    window.scrollTo({ top: 0, behavior: 'smooth' })
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function goPage(p: number | string) {
  if (typeof p === 'number') changePage(p)
}

function onHotWord(w: string) {
  keyword.value = w
  doSearch()
}

function goDetail(id: number) {
  router.push(`/community/${id}`)
}

onMounted(async () => {
  // 加载热门搜索词
  hotWords.value = await fetchCommunityHotSearchWords()
  // 如果 URL 带了 q 参数，直接搜索
  if (keyword.value) doSearch()
})
</script>

<style lang="scss" scoped>
.text-clay-foreground { color: #32325d; }
.text-clay-muted { color: #8898aa; }
.text-clay-accent { color: #5a8dee; }
.bg-clay-accent { background-color: #5a8dee; }
.font-heading { font-family: 'Nunito', 'PingFang SC', sans-serif; }
.shadow-clay-card {
  box-shadow: 16px 16px 32px rgba(165, 175, 190, 0.3), -10px -10px 24px rgba(255, 255, 255, 0.9),
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

/* 高亮关键词样式 */
:deep(mark) {
  background: linear-gradient(120deg, #ffd54f 0%, #ffb300 100%);
  color: #32325d;
  border-radius: 3px;
  padding: 0 2px;
  font-weight: 800;
}
</style>
