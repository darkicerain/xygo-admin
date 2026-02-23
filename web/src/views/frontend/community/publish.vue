<template>
  <main class="community-page px-6 pb-8 pt-12 overflow-x-hidden">
    <div class="max-w-3xl mx-auto">
      <!-- 返回 -->
      <router-link to="/community" class="inline-flex items-center gap-2 text-sm font-bold text-clay-muted hover:text-clay-accent transition-colors mb-8">
        <ArtSvgIcon icon="ri:arrow-left-line" class="text-lg" /> 返回社区
      </router-link>

      <div class="bg-white/70 backdrop-blur-xl rounded-[32px] shadow-clay-card border border-[#d1d9e6]/40 p-8 md:p-12">
        <h2 class="font-heading font-black text-2xl text-clay-foreground mb-8">发布提问</h2>

        <!-- 标题 -->
        <div class="mb-6">
          <label class="block text-sm font-bold text-clay-foreground mb-2">标题</label>
          <input
            v-model="form.title"
            type="text"
            class="w-full h-12 px-4 rounded-2xl border border-gray-200 text-sm font-medium focus:border-clay-accent focus:ring-0 outline-none transition-colors"
            placeholder="请输入问题标题"
          />
        </div>

        <!-- 分类 -->
        <div class="mb-6">
          <label class="block text-sm font-bold text-clay-foreground mb-2">分类</label>
          <div class="flex flex-wrap gap-2">
            <button
              v-for="cat in categories"
              :key="cat.id"
              class="px-5 py-2 rounded-2xl text-sm font-bold transition-all"
              :class="form.categoryId === cat.id
                ? 'bg-clay-accent text-white shadow-clay-btn'
                : 'bg-white text-clay-muted border border-gray-200 hover:border-clay-accent hover:text-clay-accent'"
              @click="form.categoryId = cat.id"
            >
              {{ cat.title }}
            </button>
          </div>
        </div>

        <!-- 标签 -->
        <div class="mb-6">
          <label class="block text-sm font-bold text-clay-foreground mb-2">标签 <span class="text-clay-muted font-normal">(用逗号分隔)</span></label>
          <input
            v-model="tagInput"
            type="text"
            class="w-full h-12 px-4 rounded-2xl border border-gray-200 text-sm font-medium focus:border-clay-accent focus:ring-0 outline-none transition-colors"
            placeholder="如：Vue3, GoFrame, 部署"
          />
        </div>

        <!-- 内容 -->
        <div class="mb-8">
          <label class="block text-sm font-bold text-clay-foreground mb-2">内容 <span class="text-clay-muted font-normal">(支持 Markdown)</span></label>
          <MdEditor
            v-model="form.content"
            :editor-id="'publish-editor'"
            :preview="false"
            :noMermaid="true"
            :noKatex="true"
            :noPrettier="true"
            :toolbarsExclude="['github','htmlPreview','catalog','mermaid','katex','prettier']"
            class="publish-editor"
          />
        </div>

        <!-- 悬赏积分 -->
        <div class="mb-8">
          <label class="block text-sm font-bold text-clay-foreground mb-2">
            悬赏积分
            <span class="text-clay-muted font-normal">（可选，采纳答案后自动发放给答主）</span>
          </label>
          <div class="flex items-center gap-3">
            <div class="relative flex-1 max-w-[200px]">
              <input
                v-model.number="form.rewardScore"
                type="number"
                min="0"
                step="10"
                class="w-full h-12 pl-4 pr-12 rounded-2xl border border-gray-200 text-sm font-bold focus:border-clay-accent focus:ring-0 outline-none transition-colors"
                placeholder="0"
              />
              <span class="absolute right-4 top-1/2 -translate-y-1/2 text-xs font-bold text-clay-muted">积分</span>
            </div>
            <div class="flex gap-2">
              <button
                v-for="preset in [10, 50, 100, 200]"
                :key="preset"
                type="button"
                class="px-3 py-2 rounded-xl text-xs font-bold transition-all"
                :class="form.rewardScore === preset
                  ? 'bg-amber-400 text-white shadow-clay-btn'
                  : 'bg-white text-clay-muted border border-gray-200 hover:border-amber-400 hover:text-amber-500'"
                @click="form.rewardScore = form.rewardScore === preset ? 0 : preset"
              >
                +{{ preset }}
              </button>
            </div>
          </div>
          <p v-if="form.rewardScore > 0" class="mt-2 text-xs text-amber-500 font-bold">
            ✦ 将悬赏 {{ form.rewardScore }} 积分，采纳答案后自动转给答主
          </p>
        </div>

        <!-- 提交 -->
        <div class="flex justify-end gap-4">
          <router-link to="/community" class="px-8 py-3 rounded-2xl bg-white text-clay-muted font-bold text-sm shadow-clay-card hover:shadow-clay-btn transition-all">
            取消
          </router-link>
          <button
            class="px-8 py-3 rounded-2xl bg-clay-accent text-white font-bold text-sm shadow-clay-btn hover:shadow-clay-btn-hover active:scale-95 transition-all"
            :disabled="submitting"
            @click="handleSubmit"
          >
            {{ submitting ? '发布中...' : '发布提问' }}
          </button>
        </div>
      </div>
    </div>

    <!-- 点选验证码 -->
    <ArtClickCaptcha ref="captchaRef" :on-success="onCaptchaSuccess" />
  </main>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { MdEditor } from 'md-editor-v3'
import 'md-editor-v3/lib/style.css'
import { ElMessage } from 'element-plus'
import { fetchCommunityCategoryList } from '@/api/frontend/community'
import { fetchCommunityPostSave } from '@/api/frontend/member/community'
import ArtClickCaptcha from '@/components/core/forms/art-click-captcha/index.vue'

defineOptions({ name: 'CommunityPublish' })

const router = useRouter()
const submitting = ref(false)
const categories = ref<any[]>([])
const tagInput = ref('')
const captchaRef = ref<InstanceType<typeof ArtClickCaptcha>>()

const form = reactive({
  title: '',
  categoryId: 0 as number,
  content: '',
  rewardScore: 0,
})

async function loadCategories() {
  categories.value = await fetchCommunityCategoryList()
}

async function handleSubmit() {
  if (!form.title.trim()) return ElMessage.warning('请输入标题')
  if (!form.categoryId) return ElMessage.warning('请选择分类')
  if (!form.content.trim()) return ElMessage.warning('请输入内容')
  // 弹出验证码
  captchaRef.value?.open()
}

async function onCaptchaSuccess(captchaId: string, captchaInfo: string) {
  submitting.value = true
  try {
    const tags = tagInput.value
      .split(/[,，]/)
      .map(t => t.trim())
      .filter(Boolean)

    await fetchCommunityPostSave({
      title: form.title,
      categoryId: form.categoryId,
      content: form.content,
      tags: tags.length ? JSON.stringify(tags) : '',
      captchaId,
      captchaInfo
    })
    ElMessage.success('发布成功')
    router.push('/community')
  } catch (e: any) {
    ElMessage.error(e?.message || '请先登录')
  } finally {
    submitting.value = false
  }
}

onMounted(() => {
  loadCategories()
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

/* 编辑器工具栏自动换行 */
.publish-editor {
  height: 400px;
  border-radius: 16px;
  overflow: hidden;
}
.publish-editor :deep(.md-editor-toolbar-wrapper) {
  overflow: visible !important;
  overflow-x: visible !important;
  overflow-y: visible !important;
}
.publish-editor :deep(.md-editor-toolbar) {
  flex-wrap: wrap !important;
  overflow: visible !important;
}
</style>
