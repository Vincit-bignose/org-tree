import { defineStore } from 'pinia';
import AuthService from '@/api.auth.js';

export const useAuthStore = defineStore({
  id: 'auth',
  state: () => ({
    isAuth: false,
    isAuthInProgress: false,
    errorMessage: '',
  }),
  actions: {
    async login(username, password) {
      this.errorMessage = '';
      if (this.isAuthInProgress) {
        return;
      }
      this.isAuthInProgress = true;
      try {
        const resp = await AuthService.login(username, password);
        localStorage.setItem('token', resp.data.access);
        this.isAuth = true;
      } catch (err) {
        console.log('login error');
        this.errorMessage = 'Ошибка входа. Пожалуйста, проверьте имя пользователя и пароль.';
      } finally {
        this.isAuthInProgress = false;
      }
    },
    async checkAuth() {
      if (this.isAuthInProgress) {
        return;
      }
      this.isAuthInProgress = true;
      try {
        const resp = await AuthService.refreshToken();
        localStorage.setItem('token', resp.data.access);
        this.isAuth = true;
      } catch (err) {
        console.log('login error');
      } finally {
        this.isAuthInProgress = false;
      }
    },
    logout() {
      this.isAuthInProgress = true;
      try {
        this.isAuth = false;
        localStorage.removeItem('token');
      } catch (err) {
        console.log('logout error');
      } finally {
        this.isAuthInProgress = false;
      }
    },
  },
});
