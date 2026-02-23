<template>
  <main class="community-page px-6 pb-8 pt-12 overflow-x-hidden">
    <div class="max-w-4xl mx-auto">
      <!-- 返回 -->
      <router-link to="/community" class="inline-flex items-center gap-2 text-sm font-bold text-clay-muted hover:text-clay-accent transition-colors mb-8">
        <ArtSvgIcon icon="ri:arrow-left-line" class="text-lg" /> 返回社区
      </router-link>

      <!-- Loading -->
      <div v-if="loading" class="text-center py-20">
        <ArtSvgIcon icon="ri:loader-4-line" class="text-3xl text-clay-muted animate-spin mx-auto" />
      </div>

      <template v-else-if="post">
        <!-- 帖子主体 -->
        <article class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8 md:p-12 mb-8">
          <div class="flex flex-wrap items-center gap-3 mb-4">
            <span class="px-3 py-1 rounded-lg bg-blue-50 text-xs font-bold text-blue-500">{{ post.categoryName }}</span>
            <span v-for="tag in parseTags(post.tags)" :key="tag" class="px-3 py-1 rounded-lg bg-gray-50 text-xs font-bold text-clay-muted">{{ tag }}</span>
            <span v-if="post.isTop" class="px-3 py-1 rounded-lg bg-amber-50 text-xs font-bold text-amber-600">置顶</span>
            <span v-if="post.isEssence" class="px-3 py-1 rounded-lg bg-green-50 text-xs font-bold text-green-600">精华</span>
          </div>

          <h1 class="font-heading font-black text-2xl md:text-3xl text-clay-foreground mb-6">{{ post.title }}</h1>

          <div class="flex items-center gap-4 mb-8 pb-6 border-b border-gray-100">
            <div class="flex items-center gap-2">
              <div class="w-8 h-8 rounded-full bg-clay-accent flex items-center justify-center text-white text-xs font-bold">
                {{ (post.memberNickname || '匿名')[0] }}
              </div>
              <span class="text-sm font-bold text-clay-foreground">{{ post.memberNickname || '匿名' }}</span>
            </div>
            <span class="text-xs text-clay-muted">{{ formatTime(post.createdAt) }}</span>
            <div class="flex items-center gap-4 ml-auto text-clay-muted text-xs">
              <span class="flex items-center gap-1"><ArtSvgIcon icon="ri:eye-line" /> {{ post.views }}</span>
              <span class="flex items-center gap-1"><ArtSvgIcon icon="ri:chat-3-line" /> {{ post.replyCount }}</span>
            </div>
          </div>

          <!-- Markdown 内容 -->
          <div class="doc-markdown-body">
            <MdPreview :model-value="post.content || ''" editor-id="post-preview" preview-theme="github" code-theme="atom" :noMermaid="true" :noKatex="true" />
          </div>

          <!-- 点赞 + 悬赏 + 收藏 -->
          <div class="flex items-center gap-4 mt-8 pt-6 border-t border-gray-100 flex-wrap">
            <button
              class="flex items-center gap-2 px-6 py-3 rounded-2xl font-bold text-sm transition-all"
              :class="post.isLiked
                ? 'bg-clay-accent text-white shadow-clay-btn'
                : 'bg-white text-clay-muted shadow-clay-card hover:text-clay-accent'"
              @click="handleLikePost"
            >
              <ArtSvgIcon :icon="post.isLiked ? 'ri:thumb-up-fill' : 'ri:thumb-up-line'" class="text-lg" />
              {{ post.likeCount }} 赞
            </button>
            <!-- 收藏按钮 -->
            <button
              class="flex items-center gap-2 px-6 py-3 rounded-2xl font-bold text-sm transition-all"
              :class="isCollected
                ? 'bg-amber-400 text-white shadow-clay-btn'
                : 'bg-white text-clay-muted shadow-clay-card hover:text-amber-500'"
              @click="handleCollect"
            >
              <ArtSvgIcon :icon="isCollected ? 'ri:bookmark-fill' : 'ri:bookmark-line'" class="text-lg" />
              {{ isCollected ? '已收藏' : '收藏' }}
            </button>
            <!-- 悬赏积分标签 -->
            <div v-if="post.rewardScore > 0" class="ml-auto flex items-center gap-2 px-5 py-3 rounded-2xl bg-amber-50 border border-amber-200">
              <ArtSvgIcon icon="ri:copper-coin-line" class="text-amber-500 text-lg" />
              <span class="text-sm font-black text-amber-600">悬赏 {{ post.rewardScore }} 积分</span>
              <span v-if="post.isAccepted" class="text-xs text-green-500 font-bold">（已采纳）</span>
            </div>
          </div>
        </article>

        <!-- 回复区 -->
        <section class="mb-8">
          <h2 class="font-heading font-extrabold text-xl text-clay-foreground mb-6">
            {{ replyTotal }} 条回复
          </h2>

          <!-- 发表回复 -->
          <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-6 mb-6">
            <textarea
              v-model="replyContent"
              rows="3"
              class="w-full border border-gray-200 rounded-2xl p-4 text-sm resize-none focus:border-clay-accent focus:ring-0 outline-none transition-colors"
              placeholder="写下你的回答..."
            ></textarea>
            <div class="flex justify-end mt-3">
              <button
                class="px-6 py-2.5 rounded-2xl bg-clay-accent text-white font-bold text-sm shadow-clay-btn hover:shadow-clay-btn-hover active:scale-95 transition-all"
                :disabled="!replyContent.trim()"
                @click="submitReply()"
              >
                发表回复
              </button>
            </div>
          </div>

          <!-- 回复列表 -->
          <div class="space-y-4">
            <div
              v-for="reply in replyList"
              :key="reply.id"
              class="bg-white/70 backdrop-blur-xl rounded-[24px] shadow-clay-card border border-[#d1d9e6]/40 p-6"
            >
              <div class="flex items-start gap-4">
                <div class="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center text-sm font-bold text-clay-muted flex-shrink-0">
                  {{ (reply.memberNickname || '匿名')[0] }}
                </div>
                <div class="flex-1 min-w-0">
                  <div class="flex items-center gap-2 mb-2">
                    <span class="text-sm font-bold text-clay-foreground">{{ reply.memberNickname || '匿名' }}</span>
                    <span v-if="reply.isAccepted" class="px-2 py-0.5 rounded bg-green-50 text-[10px] font-bold text-green-600">已采纳</span>
                    <span class="text-xs text-clay-muted ml-auto">{{ formatTime(reply.createdAt) }}</span>
                  </div>
                  <div class="text-sm text-clay-foreground leading-relaxed whitespace-pre-wrap mb-3">{{ reply.content }}</div>
                  <div class="flex items-center gap-4">
                    <button class="flex items-center gap-1 text-xs text-clay-muted hover:text-clay-accent transition-colors" @click="handleLikeReply(reply)">
                      <ArtSvgIcon :icon="reply.isLiked ? 'ri:thumb-up-fill' : 'ri:thumb-up-line'" class="text-sm" />
                      {{ reply.likeCount }}
                    </button>
                    <button class="text-xs text-clay-muted hover:text-clay-accent transition-colors" @click="startReplyTo(reply)">回复</button>
                    <button
                      v-if="post && post.memberId === currentMemberId && !reply.isAccepted && !post.isAccepted"
                      class="flex items-center gap-1 text-xs font-bold text-green-500 hover:text-green-600 border border-green-200 hover:border-green-400 px-3 py-1 rounded-lg transition-all"
                      @click="handleAccept(reply.id)"
                    >
                      <ArtSvgIcon icon="ri:check-line" class="text-sm" />
                      采纳{{ post.rewardScore > 0 ? `（+${post.rewardScore}积分给答主）` : '' }}
                    </button>
                  </div>

                  <!-- 回复输入框 -->
                  <div v-if="replyToId === reply.id" class="mt-3">
                    <textarea
                      v-model="subReplyContent"
                      rows="2"
                      class="w-full border border-gray-200 rounded-xl p-3 text-sm resize-none focus:border-clay-accent focus:ring-0 outline-none"
                      :placeholder="`回复 ${reply.memberNickname}...`"
                    ></textarea>
                    <div class="flex justify-end gap-2 mt-2">
                      <button class="px-4 py-1.5 rounded-xl text-xs font-bold text-clay-muted hover:bg-gray-100 transition-colors" @click="replyToId = 0">取消</button>
                      <button class="px-4 py-1.5 rounded-xl bg-clay-accent text-white text-xs font-bold" :disabled="!subReplyContent.trim()" @click="submitReply(reply.id)">回复</button>
                    </div>
                  </div>

                  <!-- 子回复 -->
                  <div v-if="reply.children?.length" class="mt-4 pl-4 border-l-2 border-gray-100 space-y-3">
                    <div v-for="child in reply.children" :key="child.id" class="py-2">
                      <div class="flex items-center gap-2 mb-1">
                        <span class="text-xs font-bold text-clay-foreground">{{ child.memberNickname || '匿名' }}</span>
                        <span class="text-xs text-clay-muted">{{ formatTime(child.createdAt) }}</span>
                      </div>
                      <div class="text-sm text-clay-muted">{{ child.content }}</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </template>
    </div>

    <!-- 点选验证码 -->
    <ArtClickCaptcha ref="captchaRef" :on-success="onCaptchaSuccess" />
  </main>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { MdPreview } from 'md-editor-v3'
import 'md-editor-v3/lib/preview.css'
import { ElMessage } from 'element-plus'
import { ApiStatus } from '@/utils/http/status'
import { fetchCommunityPostDetail, fetchCommunityReplyList } from '@/api/frontend/community'
import { fetchCommunityReplySave, fetchCommunityLike, fetchCommunityAcceptReply, fetchCommunityCollect } from '@/api/frontend/member/community'
import { useMemberStore } from '@/store/modules/member'
import ArtClickCaptcha from '@/components/core/forms/art-click-captcha/index.vue'

defineOptions({ name: 'CommunityDetail' })

const route = useRoute()
const memberStore = useMemberStore()
const loading = ref(true)

const captchaRef = ref<InstanceType<typeof ArtClickCaptcha>>()
const pendingParentId = ref(0)
const post = ref<any>(null)
const replyList = ref<any[]>([])
const replyTotal = ref(0)
const replyContent = ref('')
const subReplyContent = ref('')
const replyToId = ref(0)
const isCollected = ref(false)
const currentMemberId = ref(0)

function parseTags(tags: string): string[] {
  if (!tags) return []
  try { return JSON.parse(tags) } catch { return [] }
}

function formatTime(ts: number): string {
  if (!ts) return ''
  const now = Date.now() / 1000
  const diff = now - ts
  if (diff < 60) return '刚刚'
  if (diff < 3600) return `${Math.floor(diff / 60)}分钟前`
  if (diff < 86400) return `${Math.floor(diff / 3600)}小时前`
  if (diff < 604800) return `${Math.floor(diff / 86400)}天前`
  const d = new Date(ts * 1000)
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
}

async function loadPost() {
  loading.value = true
  try {
    const id = Number(route.params.id)
    post.value = await fetchCommunityPostDetail(id)
    // 从 store 获取当前登录用户 ID
    const info = memberStore.getMemberInfo
    currentMemberId.value = info?.id ?? 0
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

async function handleCollect() {
  if (!currentMemberId.value) {
    ElMessage.warning('请先登录')
    return
  }
  try {
    const res = await fetchCommunityCollect(post.value.id)
    isCollected.value = res?.isCollected ?? !isCollected.value
    ElMessage.success(isCollected.value ? '收藏成功' : '已取消收藏')
  } catch { /* 拦截器处理 */ }
}

async function loadReplies() {
  const id = Number(route.params.id)
  const res = await fetchCommunityReplyList({ postId: id, page: 1, pageSize: 100 })
  replyList.value = res?.list ?? []
  replyTotal.value = res?.total ?? 0
}

async function submitReply(parentId = 0) {
  const content = parentId ? subReplyContent.value : replyContent.value
  if (!content.trim()) return
  // 记住 parentId，弹出验证码
  pendingParentId.value = parentId
  captchaRef.value?.open()
}

async function onCaptchaSuccess(captchaId: string, captchaInfo: string) {
  const parentId = pendingParentId.value
  const content = parentId ? subReplyContent.value : replyContent.value
  try {
    await fetchCommunityReplySave({
      postId: Number(route.params.id),
      parentId,
      content,
      captchaId,
      captchaInfo
    })
    ElMessage.success('回复成功')
    if (parentId) { subReplyContent.value = ''; replyToId.value = 0 }
    else { replyContent.value = '' }
    loadReplies()
    loadPost()
  } catch (e: any) {
    if (e?.code !== ApiStatus.unauthorized) ElMessage.error(e?.message || '操作失败')
  }
}

async function handleLikePost() {
  try {
    const res = await fetchCommunityLike({ targetType: 1, targetId: post.value.id })
    post.value.isLiked = (res as any)?.isLiked ?? !post.value.isLiked
    post.value.likeCount += post.value.isLiked ? 1 : -1
  } catch (e: any) {
    if (e?.code !== ApiStatus.unauthorized) ElMessage.error(e?.message || '操作失败')
  }
}

async function handleLikeReply(reply: any) {
  try {
    const res = await fetchCommunityLike({ targetType: 2, targetId: reply.id })
    reply.isLiked = (res as any)?.isLiked ?? !reply.isLiked
    reply.likeCount += reply.isLiked ? 1 : -1
  } catch (e: any) {
    if (e?.code !== ApiStatus.unauthorized) ElMessage.error(e?.message || '操作失败')
  }
}

async function handleAccept(replyId: number) {
  try {
    await fetchCommunityAcceptReply(replyId)
    ElMessage.success(post.value?.rewardScore > 0 ? `已采纳，答主获得 ${post.value.rewardScore} 积分奖励` : '已采纳最佳回答')
    // 更新本地状态
    if (post.value) post.value.isAccepted = true
    replyList.value.forEach((r: any) => {
      r.isAccepted = r.id === replyId ? 1 : 0
    })
  } catch (e: any) {
    if (e?.code !== ApiStatus.unauthorized) ElMessage.error(e?.message || '操作失败')
  }
}

function startReplyTo(reply: any) {
  replyToId.value = reply.id
  subReplyContent.value = ''
}

onMounted(() => {
  loadPost()
  loadReplies()
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
.doc-markdown-body {
  :deep(.md-editor) { background: transparent; }
  :deep(.md-editor-preview-wrapper) { padding: 0; }
  :deep(.md-editor-preview) {
    font-size: 15px; line-height: 1.8; color: #32325d;
    h1, h2, h3, h4 { font-family: 'Nunito', 'PingFang SC', sans-serif; font-weight: 800; color: #32325d; }
    a { color: #5a8dee; }
    code:not([class*="language-"]) { background: #f0f3f8; padding: 2px 6px; border-radius: 6px; font-size: 0.9em; color: #e74c3c; }
    pre { border-radius: 12px; }
    img { border-radius: 12px; max-width: 100%; }
  }
}
</style>
