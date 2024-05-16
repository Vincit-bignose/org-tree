<script setup>
import Dialog from 'primevue/dialog';
import Button from 'primevue/button';
import Avatar from 'primevue/avatar';
import ProgressSpinner from 'primevue/progressspinner';
import 'primeicons/primeicons.css'
import { useEmployeeStore } from '@/stores/employeeStore.js';
const eS = useEmployeeStore()
const baseUrl = import.meta.env.VITE_BASE_URL
</script>

<template>
  <div v-if="eS.isLoading"
    class="justify-content-center align-items-center"
  >
    <ProgressSpinner />
  </div>
  <div v-else
    class="card flex justify-content-center"
  >
    <Dialog v-model:visible="eS.isDialog" modal header="Профиль" :style="{ width: '25rem' }">

      <div v-if="eS.data.photo"
        class="flex justify-content-center">
        <img :alt="eS.data.last_name" :src="`${baseUrl}${eS.data.photo}`" class="max-w-16rem border-circle"/>
      </div>
      <div v-else class="flex justify-content-center">
        <Avatar icon="pi pi-user" size="xlarge" shape="circle" />
      </div>
      <div class="mt-3 text-center text-xl font-semibold">
        {{eS.data.last_name}} {{eS.data.first_name}} {{ eS.data.surname }}
      </div>
      <div class="text-center">
        {{ eS.data.position }}
      </div>
      <div class="mt-5 flex align-items-end">
        <i class="pi pi-at"></i>
        <div class="ml-3"><a :href="`mailto: ${eS.data.email}`">{{ eS.data.email }}</a></div> 
      </div>
      <div class="mt-2 flex align-items-end">
        <i class="pi pi-phone"></i>
        <div class="ml-3"><a :href="`tel:${eS.data.phone1}`">{{ eS.data.phone1 }}</a></div> 
      </div>
      <div v-if="eS.data.phone2"
        class="mt-2 flex align-items-end">
        <i class="pi pi-phone"></i>
        <div class="ml-3"><a :href="`tel:${eS.data.phone2}`">{{ eS.data.phone2 }}</a></div> 
      </div>
      <div class="mt-2 flex align-items-end">
        <i class="pi pi-calendar-clock"></i>
        <div class="ml-3">{{ eS.data.schedule }}</div> 
      </div>
      <div class="mt-2 flex align-items-end">
        <i class="pi pi-map-marker"></i>
        <div class="ml-3 font-italic">{{ eS.data.address }}</div> 
      </div>

      
      <div class="flex justify-content-end gap-2 mt-4">
          <Button type="button" label="Закрыть" severity="secondary" @click="eS.isDialog = false"></Button>
      </div>
    </Dialog>
  </div>
</template>
