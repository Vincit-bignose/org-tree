import axios from "axios";
import { useAuthStore } from '@/stores/authStore.js';

const url = import.meta.env.VITE_URL
export const instance = axios.create({
  withCredentials: true,
  baseURL: url,
});

instance.interceptors.request.use(
  (config) => {
    config.headers.Authorization = `Bearer ${localStorage.getItem("token")}`
    return config
  }
)

instance.interceptors.response.use(
  (config) => {
    return config;
  },
  async (error) => {
    if (!error.config.url.endsWith('/token/refresh/')){
      const originalRequest = error.config;
      if (
        error.response.status == 401 && 
        error.config &&
        !originalRequest._isRetry
      ) {
        originalRequest._isRetry = true; 
        try {
          const resp = await instance.post("/token/refresh/");
          localStorage.setItem("token", resp.data.access);
          return instance.request(originalRequest);
        } catch (error) {
          console.log("НЕ АВТОРИЗОВАН");
        }
      }
      throw error;
      } else {
        const authStore = useAuthStore();
        console.log('Авторизуйтесь!')
        authStore.logout()
      }
  }
);