<template>
  <div class="characters-container">
    <!-- Dome (background layer) -->
    <div ref="orangeRef" class="char dome" :style="orangeStyle">
      <div class="eyes" :style="orangeEyesStyle">
        <Pupil :size="10" pupil-color="var(--el-color-primary-dark-2)" />
        <Pupil :size="10" pupil-color="var(--el-color-primary-dark-2)" />
      </div>
    </div>

    <!-- Tall pill (main character) -->
    <div ref="purpleRef" class="char tall-pill" :style="purpleStyle">
      <div class="eyes" :style="purpleEyesStyle">
        <EyeBall
          :size="40"
          :pupil-size="14"
          :is-blinking="isPurpleBlinking"
          :force-look-x="purpleLookX"
          :force-look-y="purpleLookY"
        />
        <EyeBall
          :size="40"
          :pupil-size="14"
          :is-blinking="isPurpleBlinking"
          :force-look-x="purpleLookX"
          :force-look-y="purpleLookY"
        />
      </div>
    </div>

    <!-- Medium rounded (secondary) -->
    <div ref="blackRef" class="char medium-round" :style="blackStyle">
      <div class="eyes" :style="blackEyesStyle">
        <EyeBall
          :size="32"
          :pupil-size="12"
          :is-blinking="isBlackBlinking"
          :force-look-x="blackLookX"
          :force-look-y="blackLookY"
        />
        <EyeBall
          :size="32"
          :pupil-size="12"
          :is-blinking="isBlackBlinking"
          :force-look-x="blackLookX"
          :force-look-y="blackLookY"
        />
      </div>
    </div>

    <!-- Small accent -->
    <div ref="yellowRef" class="char small-accent" :style="yellowStyle">
      <div class="eyes" :style="yellowEyesStyle">
        <EyeBall :size="30" :pupil-size="10" />
        <EyeBall :size="30" :pupil-size="10" />
      </div>
      <div class="mouth" :style="yellowMouthStyle" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, watch, onMounted, onUnmounted } from 'vue'
import EyeBall from './EyeBall.vue'
import Pupil from './Pupil.vue'

const props = withDefaults(
  defineProps<{
    isTyping?: boolean
    hasSecret?: boolean
    secretVisible?: boolean
  }>(),
  {
    isTyping: false,
    hasSecret: false,
    secretVisible: false,
  }
)

const mouseX = ref(0)
const mouseY = ref(0)
const isPurpleBlinking = ref(false)
const isBlackBlinking = ref(false)
const isLookingAtEachOther = ref(false)
const isPurplePeeking = ref(false)

const purpleRef = ref<HTMLDivElement | null>(null)
const blackRef = ref<HTMLDivElement | null>(null)
const yellowRef = ref<HTMLDivElement | null>(null)
const orangeRef = ref<HTMLDivElement | null>(null)

const purplePos = reactive({ faceX: 0, faceY: 0, bodySkew: 0 })
const blackPos = reactive({ faceX: 0, faceY: 0, bodySkew: 0 })
const yellowPos = reactive({ faceX: 0, faceY: 0, bodySkew: 0 })
const orangePos = reactive({ faceX: 0, faceY: 0, bodySkew: 0 })

const hiding = computed(() => props.hasSecret && props.secretVisible)
const leaning = computed(() => props.isTyping || (props.hasSecret && !props.secretVisible))

function calcPos(
  el: HTMLDivElement | null,
  target: { faceX: number; faceY: number; bodySkew: number }
) {
  if (!el) return
  const r = el.getBoundingClientRect()
  const dx = mouseX.value - (r.left + r.width / 2)
  const dy = mouseY.value - (r.top + r.height / 3)
  target.faceX = Math.max(-15, Math.min(15, dx / 20))
  target.faceY = Math.max(-10, Math.min(10, dy / 30))
  target.bodySkew = Math.max(-6, Math.min(6, -dx / 120))
}

let rafId = 0
function tick() {
  calcPos(purpleRef.value, purplePos)
  calcPos(blackRef.value, blackPos)
  calcPos(yellowRef.value, yellowPos)
  calcPos(orangeRef.value, orangePos)
  rafId = requestAnimationFrame(tick)
}

function onMouseMove(e: MouseEvent) {
  mouseX.value = e.clientX
  mouseY.value = e.clientY
}

function setupBlink(target: { value: boolean }) {
  let t: number
  const go = () => {
    t = window.setTimeout(() => {
      target.value = true
      window.setTimeout(() => {
        target.value = false
        go()
      }, 150)
    }, Math.random() * 4000 + 3000)
  }
  go()
  return () => clearTimeout(t)
}

let stopP: (() => void) | undefined
let stopB: (() => void) | undefined

onMounted(() => {
  window.addEventListener('mousemove', onMouseMove)
  stopP = setupBlink(isPurpleBlinking)
  stopB = setupBlink(isBlackBlinking)
  rafId = requestAnimationFrame(tick)
})

onUnmounted(() => {
  window.removeEventListener('mousemove', onMouseMove)
  cancelAnimationFrame(rafId)
  stopP?.()
  stopB?.()
})

watch(
  () => props.isTyping,
  (v) => {
    if (v) {
      isLookingAtEachOther.value = true
      setTimeout(() => {
        isLookingAtEachOther.value = false
      }, 800)
    } else {
      isLookingAtEachOther.value = false
    }
  }
)

let peekT: number | undefined
watch([() => props.hasSecret, () => props.secretVisible, isPurplePeeking], () => {
  clearTimeout(peekT)
  if (props.hasSecret && props.secretVisible) {
    peekT = window.setTimeout(() => {
      isPurplePeeking.value = true
      setTimeout(() => {
        isPurplePeeking.value = false
      }, 800)
    }, Math.random() * 3000 + 2000)
  } else {
    isPurplePeeking.value = false
  }
})

// --- Computed styles ---

const purpleStyle = computed(() => ({
  height: leaning.value ? '400px' : '360px',
  transform: hiding.value
    ? 'skewX(0deg)'
    : leaning.value
      ? `skewX(${purplePos.bodySkew - 10}deg) translateX(35px)`
      : `skewX(${purplePos.bodySkew}deg)`,
}))

const purpleEyesStyle = computed(() => ({
  left: hiding.value
    ? '15px'
    : isLookingAtEachOther.value
      ? '50px'
      : `${38 + purplePos.faceX}px`,
  top: hiding.value
    ? '30px'
    : isLookingAtEachOther.value
      ? '55px'
      : `${38 + purplePos.faceY}px`,
  gap: '26px',
}))

const purpleLookX = computed(() =>
  hiding.value ? (isPurplePeeking.value ? 4 : -4) : isLookingAtEachOther.value ? 3 : undefined
)
const purpleLookY = computed(() =>
  hiding.value ? (isPurplePeeking.value ? 5 : -4) : isLookingAtEachOther.value ? 4 : undefined
)

const blackStyle = computed(() => ({
  transform: hiding.value
    ? 'skewX(0deg)'
    : isLookingAtEachOther.value
      ? `skewX(${blackPos.bodySkew * 1.5 + 10}deg) translateX(18px)`
      : leaning.value
        ? `skewX(${blackPos.bodySkew * 1.5}deg)`
        : `skewX(${blackPos.bodySkew}deg)`,
}))

const blackEyesStyle = computed(() => ({
  left: hiding.value
    ? '8px'
    : isLookingAtEachOther.value
      ? '25px'
      : `${18 + blackPos.faceX}px`,
  top: hiding.value
    ? '22px'
    : isLookingAtEachOther.value
      ? '10px'
      : `${30 + blackPos.faceY}px`,
  gap: '20px',
}))

const blackLookX = computed(() =>
  hiding.value ? -4 : isLookingAtEachOther.value ? 0 : undefined
)
const blackLookY = computed(() =>
  hiding.value ? -4 : isLookingAtEachOther.value ? -4 : undefined
)

const orangeStyle = computed(() => ({
  transform: hiding.value ? 'skewX(0deg)' : `skewX(${orangePos.bodySkew}deg)`,
}))

const orangeEyesStyle = computed(() => ({
  left: hiding.value ? '40px' : `${72 + orangePos.faceX}px`,
  top: hiding.value ? '68px' : `${80 + orangePos.faceY}px`,
  gap: '26px',
}))

const yellowStyle = computed(() => ({
  transform: hiding.value ? 'skewX(0deg)' : `skewX(${yellowPos.bodySkew}deg)`,
}))

const yellowEyesStyle = computed(() => ({
  left: hiding.value ? '15px' : `${28 + yellowPos.faceX}px`,
  top: hiding.value ? '28px' : `${35 + yellowPos.faceY}px`,
  gap: '20px',
}))

const yellowMouthStyle = computed(() => ({
  left: hiding.value ? '8px' : `${22 + yellowPos.faceX}px`,
  top: hiding.value ? '70px' : `${78 + yellowPos.faceY}px`,
}))
</script>

<style scoped>
.characters-container {
  position: relative;
  width: 550px;
  height: 400px;
  transform: scale(0.8);
  transform-origin: center bottom;
}

.char {
  position: absolute;
  bottom: 0;
  transition: all 0.7s ease-in-out;
  transform-origin: bottom center;
}

.tall-pill {
  left: 80px;
  z-index: 2;
  width: 150px;
  background: var(--el-color-primary);
  border-radius: 75px 75px 24px 24px;
  box-shadow: 0 8px 32px rgb(0 0 0 / 8%);
}

.medium-round {
  left: 230px;
  z-index: 3;
  width: 110px;
  height: 270px;
  background: var(--el-color-primary-dark-2);
  border-radius: 55px 55px 18px 18px;
  box-shadow: 0 8px 32px rgb(0 0 0 / 8%);
}

.dome {
  left: 0;
  z-index: 1;
  width: 220px;
  height: 180px;
  background: var(--el-color-primary-light-7);
  border-radius: 110px 110px 20px 20px;
}

.small-accent {
  left: 330px;
  z-index: 4;
  width: 125px;
  height: 210px;
  background: var(--el-color-primary-light-4);
  border-radius: 62px 62px 16px 16px;
  box-shadow: 0 8px 32px rgb(0 0 0 / 6%);
}

.eyes {
  position: absolute;
  display: flex;
  transition: all 0.7s ease-in-out;
}

.mouth {
  position: absolute;
  width: 60px;
  height: 3px;
  background: var(--el-color-primary-dark-2);
  border-radius: 3px;
  transition: all 0.2s ease-out;
}
</style>
