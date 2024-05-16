import { instance } from "./api.config";

const CompanyService = {
    getCompanies() {
        return instance.get('/companies/');
    },
};

export default CompanyService;
