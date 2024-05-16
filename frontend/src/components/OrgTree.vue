<script setup>
import { ref, computed } from 'vue';
import { instance } from "@/api.config.js"
import OrganizationChart from 'primevue/organizationchart';
import Button from 'primevue/button';
import ProgressSpinner from 'primevue/progressspinner';
import Card from 'primevue/card';
import Avatar from 'primevue/avatar';
import Dialog from '@/components/Dialog.vue'
import { useEmployeeStore } from '@/stores/employeeStore.js';
import { useCompanyStore } from '@/stores/companiesStore.js';

const companyStore = useCompanyStore()
const companies = ref([])
companyStore.getCompanies()
companyStore.$subscribe((mutation, state) => {
  if (mutation.type === 'direct' && mutation.storeId === 'company') {
    if (state.isLoading === false) {
      companies.value = state.companies;
    }
  }
});

const employeeStore = useEmployeeStore()
const baseUrl = import.meta.env.VITE_BASE_URL
const responseData = ref(null);
const transformedData = ref([]);
const orgTree = ref({});
const buttonPressed = ref(null)
const isLoading = ref(false)


async function fetchData(id) {
  isLoading.value = true
  try {
    const response = await instance.get(`/company/${id}`);
    responseData.value = response.data;
    transformData(responseData.value);
    const idx = companies.value.findIndex(company => company.id === id);
    getOrgTree(idx);
  } catch (error) {
    console.error('Ошибка при получении данных:', error);
  } finally {
    isLoading.value = false
  }
}

function transformData(data) {
  transformedData.value = data.map(item => ({
    key: item.id.toString(),
    type: 'department',
    data: {
      name: item.name,
      description: item.description,
      supervisor: item.supervisor ? {
        id: item.supervisor.id,
        last_name: item.supervisor.last_name,
        first_name: item.supervisor.first_name,
        photo: item.supervisor.photo,
        position: item.supervisor.position
      } : null,
      responsible: item.responsible ? {
        id: item.responsible.id,
        last_name: item.responsible.last_name,
        first_name: item.responsible.first_name,
        photo: item.responsible.photo,
        position: item.responsible.position
      } : null,
      employees: item.employees.map(employee => ({
        id: employee.id,
        last_name: employee.last_name,
        first_name: employee.first_name,
        photo: employee.photo,
        position: employee.position
      })),
    },
    children: transformChildren(item.child_departments)
  }));
}

function transformChildren(children) {
  if (!children || children.length === 0) {
    return [];
  }
  return children.map(child => ({
    key: child.id.toString(),
    type: 'department',
    data: {
      name: child.name,
      description: child.description,
      supervisor: child.supervisor ? {
        id: child.supervisor.id,
        last_name: child.supervisor.last_name,
        first_name: child.supervisor.first_name,
        photo: child.supervisor.photo,
        position: child.supervisor.position
      } : null,
      responsible: child.responsible ? {
        id: child.responsible.id,
        last_name: child.responsible.last_name,
        first_name: child.responsible.first_name,
        photo: child.responsible.photo,
        position: child.responsible.position
      } : null,
      employees: child.employees.map(employee => ({
        id: employee.id,
        last_name: employee.last_name,
        first_name: employee.first_name,
        photo: employee.photo,
        position: employee.position
      })),
    },
    children: transformChildren(child.child_departments)
  }));
}

function getOrgTree(idx) {
  const company = companies.value[idx];
  orgTree.value = {
    key: `0${idx.toString()}`,
    type: 'company',
    data: {
      name: company.name,
      logo: company.logo,
      description: company.description,
      address: company.headquarters_location
    },
    children: transformedData.value
  };
}

function show(id) {
  fetchData(id);
  buttonPressed.value = id
}

// onMounted(async () => {
//   try {
//     const response = await instance.get('/companies/');
//     companies.value = response.data;
//   } catch (error) {
//     console.error('Ошибка при загрузке компаний:', error);
//   }
// });

const isOrgTreeEmpty = computed(() => {
  return Object.keys(orgTree.value).length === 0;
})

function getEmployeeDetail(id) {
  employeeStore.employeeId = id
  employeeStore.detail()
  employeeStore.isDialog = true
}
</script>

<template>
  <div class="w-full fixed top-0 left-0 z-1 flex justify-content-center align-items-center py-3 overflow-x">
    <div class="flex justify-content-center mt-3">
      <div v-for="(company, idx) in companies" :key="company.id" class="mx-3">
        <Button
        :label="company.name" 
        :raised="company.id !== buttonPressed" 
        :disabled="company.id === buttonPressed" 
        :text ="company.id !== buttonPressed"
        :icon="company.id === buttonPressed ? 'pi pi-check' : null" 
        @click="show(company.id)"
        />
      </div>
  </div>
  </div>
  
  <br>
  <div 
    class="flex justify-content-center"
    v-if="isLoading || companyStore.isLoading"
  >
    <ProgressSpinner />
  </div>
  <OrganizationChart 
    :value="orgTree" 
    collapsible
    v-if="!isOrgTreeEmpty && !isLoading"
    class="mt-8"
  >
    <template #department="slotProps">
      <Card style="width: 23rem; overflow: hidden" class="shadow-3">
        <template #title>{{ slotProps.node.data.name }}</template>
        <template #subtitle>{{ slotProps.node.data.description }}</template>
        <template #content>
            <p class="m-0">
              <!-- supervisor -->
              <div v-if="slotProps.node.data.supervisor">
                <div @click="getEmployeeDetail(slotProps.node.data.supervisor.id)" class="flex justify-content-between align-items-center hover:surface-50 border-round" style="cursor: pointer;">
                  <div v-if="slotProps.node.data.supervisor.photo">
                    <Avatar :image="slotProps.node.data.supervisor.photo" size="large" shape="circle" />
                  </div>
                  <div v-else>
                    <Avatar
                     :label="(slotProps.node.data.supervisor.last_name[0] + slotProps.node.data.supervisor.first_name[0])" 
                     size="large" 
                     shape="circle" 
                    />
                  </div>
                  <div class="justify-content-center w-full">
                    <div class="text-sm text-500 font-italic">{{ slotProps.node.data.supervisor.position }}</div>
                    <div>{{ slotProps.node.data.supervisor.last_name }} {{ slotProps.node.data.supervisor.first_name }}</div>
                  </div>
                  <i class="pi pi-star ml-5"></i>
                </div>
              </div>
              <!-- responsible -->
              <div v-if="slotProps.node.data.responsible">
                <div @click="getEmployeeDetail(slotProps.node.data.responsible.id)" class="flex justify-content-between align-items-center hover:surface-50 border-round" style="cursor: pointer;">
                  <div v-if="slotProps.node.data.responsible.photo">
                    <Avatar :image="slotProps.node.data.responsible.photo" size="large" shape="circle" />
                  </div>
                  <div v-else>
                    <Avatar
                     :label="(slotProps.node.data.responsible.last_name[0] + slotProps.node.data.responsible.first_name[0])"
                     size="large" 
                     shape="circle" 
                    />
                  </div>
                  <div class="w-full">
                    <div class="text-sm text-500 font-italic">{{ slotProps.node.data.responsible.position }}</div>
                    <div>{{ slotProps.node.data.responsible.last_name }} {{ slotProps.node.data.responsible.first_name }}</div>
                  </div>
                  <div>
                    <i class="pi pi-user ml-5"></i>
                  </div>
                </div>
              </div>
              <!-- employees -->
              <div v-for="employee in slotProps.node.data.employees" :key="employee.id">
              <div v-if="!(slotProps.node.data.supervisor && slotProps.node.data.supervisor.id === employee.id) && !(slotProps.node.data.responsible && slotProps.node.data.responsible.id === employee.id)">
                <div @click="getEmployeeDetail(employee.id)" class="flex justify-content-between align-items-center my-2 hover:surface-50 border-round" style="cursor: pointer;">
                  <div v-if="employee.photo">
                    <Avatar :image="employee.photo" size="large" shape="circle" />
                  </div>
                  <div v-else>
                    <Avatar
                     :label="(employee.last_name[0] + employee.first_name[0])"
                     size="large" 
                     shape="circle" 
                    />
                  </div>
                  <div class="justify-content-center w-full">
                    <div class="text-sm text-500 font-italic">{{ employee.position }}</div>
                    <div>{{ employee.last_name }} {{ employee.first_name }}</div>
                  </div>
                  <div class="ml-6"></div>
                </div>
              </div>
            </div>
            </p>
        </template>
      </Card>
    </template>
    <template #company="slotProps">
      <Card style="width: 25rem; overflow: hidden" class="shadow-3">
        <template #header v-if="slotProps.node.data.logo">
          <img :alt="slotProps.node.data.name" :src="`${baseUrl}${slotProps.node.data.logo}`" class="max-w-25rem"/>
        </template>
        <template #title>{{ slotProps.node.data.name }}</template>
        <template #subtitle>{{ slotProps.node.data.address }}</template>
        <template #content>
            <p class="m-0">
              {{ slotProps.node.data.description }}
            </p>
        </template>
      </Card>
    </template>
  </OrganizationChart>
  <Dialog />
</template>