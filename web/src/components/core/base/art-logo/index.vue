<!-- 系统logo -->
<template>
  <div class="flex-cc">
    <img 
      :style="logoStyle" 
      :src="logoUrl" 
      alt="logo" 
      class="w-full h-full object-contain" 
    />
  </div>
</template>

<script setup lang="ts">
  import { useSiteStore } from '@/store/modules/site'
  import defaultLogo from '@imgs/common/logo.webp'

  defineOptions({ name: 'ArtLogo' })

  interface Props {
    /** logo 大小 */
    size?: number | string
  }

  const props = withDefaults(defineProps<Props>(), {
    size: 36
  })

  const siteStore = useSiteStore()
  const logoUrl = computed(() => siteStore.getLogo() || defaultLogo)
  const logoStyle = computed(() => ({ width: `${props.size}px` }))
</script>
