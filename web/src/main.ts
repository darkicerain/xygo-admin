import App from './App.vue'
import { createApp } from 'vue'
import { initStore } from './store'                 // Store
import { initRouter } from './router'               // Router
import language from './locales'                    // 国际化
import '@styles/core/tailwind.css'                  // tailwind
import '@styles/index.scss'                         // 样式
import '@utils/sys/console.ts'                      // 控制台输出内容
import { setupGlobDirectives } from './directives'
import { setupErrorHandle } from './utils/sys/error-handle'
import { config } from 'md-editor-v3'
import hljs from 'highlight.js'
import Cropper from 'cropperjs'
import screenfull from 'screenfull'
import { echarts } from '@/plugins/echarts'
import atomLight from 'highlight.js/styles/atom-one-light.min.css?url'
import atomDark from 'highlight.js/styles/atom-one-dark.min.css?url'
import githubLight from 'highlight.js/styles/github.min.css?url'
import githubDark from 'highlight.js/styles/github-dark.min.css?url'

config({
  editorExtensions: {
    highlight: {
      instance: hljs,
      css: {
        atom: { light: atomLight, dark: atomDark },
        github: { light: githubLight, dark: githubDark },
      },
    },
    cropper: { instance: Cropper },
    screenfull: { instance: screenfull },
    echarts: { instance: echarts },
  },
})

document.addEventListener(
  'touchstart',
  function () {},
  { passive: false }
)

const app = createApp(App)
initStore(app)
initRouter(app)
setupGlobDirectives(app)
setupErrorHandle(app)

app.use(language)
app.mount('#app')