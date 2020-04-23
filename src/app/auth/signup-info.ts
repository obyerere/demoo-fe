export class SignUpInfo {
    name: string;
    username: string;
    email: string;
    role: string[];
    password: string;
    tenant: string;

    constructor(name: string, username: string, email: string, password: string ,tenant : string) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = ['user'];
        this.tenant = tenant;
    }
}
