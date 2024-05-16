<script setup>
import { onMounted } from 'vue';
import Login from '@/components/Login.vue';
import OrgTree from '@/components/OrgTree.vue';
import { useAuthStore } from '@/stores/authStore.js';
import ProgressSpinner from 'primevue/progressspinner';
import Button from 'primevue/button';

const authStore = useAuthStore()
onMounted(() => {
  if (localStorage.getItem('token')) {
    authStore.checkAuth()
  }
})
</script>

<template>
  <div 
    class="flex justify-content-center align-items-center h-screen"
    v-if="authStore.isAuthInProgress"
  >
    <ProgressSpinner />
  </div>
  <div v-else-if="authStore.isAuth" class="relative">
    <Button label="Выйти" severity="info" raised @click="authStore.logout()" class="fixed z-2 top-0 right-0 mr-5 mt-5"/>
    <OrgTree />
  </div>
  <Login v-else />
</template>
