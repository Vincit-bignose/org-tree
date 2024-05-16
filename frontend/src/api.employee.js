import { instance } from "./api.config";

const EmployeeService = {
    detail(id) {
        return instance.get(`employee/${id}/`);
    },
};

export default EmployeeService;