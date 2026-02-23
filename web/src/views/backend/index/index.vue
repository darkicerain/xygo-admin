<!-- 布局容器 -->
<template>
  <div class="app-layout">
    <aside id="app-sidebar">
      <ArtSidebarMenu />
    </aside>

    <main id="app-main">
      <div id="app-header">
        <ArtHeaderBar />
      </div>
      <div id="app-content">
        <ArtPageContent />
      </div>
    </main>

    <div id="app-global">
      <ArtGlobalComponent />
    </div>
  </div>
</template>

<script setup lang="ts">
  import { onMounted, onUnmounted } from 'vue'
  import { useWebSocketStore } from '@/stores/backend/websocket'

  defineOptions({ name: 'AppLayout' })

  const wsStore = useWebSocketStore()

  // Layout 挂载后自动建立 WebSocket 连接
  onMounted(() => {
    wsStore.connect()
  })

  // Layout 卸载时断开 WebSocket
  onUnmounted(() => {
    wsStore.disconnect()
  })
</script>

<style lang="scss" scoped>
  @use './style';
</style>
