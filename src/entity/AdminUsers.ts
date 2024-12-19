import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from "typeorm";
import { AdminUserRols } from "./AdminUserRols";

@Entity()
export class AdminUser {

    @PrimaryGeneratedColumn()
    id: number;

    @Column("varchar", { length: 100 })
    username: string;

    @Column("text")
    password: string;

    @Column("varchar", { length: 100 })
    user_email: number;
    
    @Column("tinyint")
    first_login: number;
    
    @Column("varchar", { length: 5 })
    restore_code: string;
    
    @Column("tinyint")
    active: number;
    
    @ManyToOne(type => AdminUserRols, adminUserRols => adminUserRols.id, {onDelete:'SET NULL'})
    role: number;

}
