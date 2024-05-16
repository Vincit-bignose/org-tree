<script setup>
import { ref } from 'vue';
import InputGroup from 'primevue/inputgroup';
import InputGroupAddon from 'primevue/inputgroupaddon';
import InputText from 'primevue/inputtext';
import Password from 'primevue/password';
import 'primeicons/primeicons.css'
import Button from 'primevue/button'
import { useAuthStore } from '@/stores/authStore.js';
import Message from 'primevue/message';
const authStore = useAuthStore()

const pwd = ref('');
const username = ref('')
</script>

<template>
  <div class="card flex flex-column gap-3 justify-content-center mx-auto full-screen w-20rem">
    <Message v-if="authStore.errorMessage" severity="error">{{ authStore.errorMessage }}</Message>
    <InputGroup>
      <InputGroupAddon>
          <i class="pi pi-user"></i>
      </InputGroupAddon>
      <InputText v-model="username" placeholder="Имя пользователя" />
    </InputGroup>

    <InputGroup>
      <InputGroupAddon>
        <i class="pi pi-shield"></i>
      </InputGroupAddon>
      <Password v-model="pwd" :feedback="false" placeholder="Пароль"/>
    </InputGroup>
    <Button 
    label="Войти"
    @click="authStore.login(username, pwd)"
     />
  </div>
</template>

<style scoped>
.full-screen{
  height: 90vh;
}
</style>