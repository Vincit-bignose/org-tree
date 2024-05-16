import { defineStore } from 'pinia';
import CompanyService from '@/api.company';

export const useCompanyStore = defineStore({
  id: 'company',
  state: () => ({
    isLoading: false,
    companies: [],
  }),
  actions: {
    async getCompanies() {
      this.isLoading = true;
      try {
        const resp = await CompanyService.getCompanies();
        this.companies = resp.data
      } catch (err) {
        console.log(err);
      } finally {
        this.isLoading = false;
      }
    },
  },
});
