import { instance } from "@/api.config.js"

const AuthService = {
    login(username, password) {
        return instance.post("/token/", {username, password});
    },
    
    refreshToken() {
        return instance.post("/token/refresh/");
    },
};

export default AuthService;