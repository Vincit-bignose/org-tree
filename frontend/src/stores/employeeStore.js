import { defineStore } from 'pinia';
import EmployeeService from '@/api.employee';

export const useEmployeeStore = defineStore({
  id: 'employee',
  state: () => ({
    isDialog: false,
    isLoading: false,
    employeeId: null,
    data: {},
  }),
  actions: {
    async detail() {
      this.isLoading = true;
      try {
        const resp = await EmployeeService.detail(this.employeeId);
        this.data = resp.data
      } catch (err) {
        console.log(err);
      } finally {
        this.isLoading = false;
      }
    },
  },
});
