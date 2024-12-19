import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class AdminUserRols {

    @PrimaryGeneratedColumn()
    id: number;

    @Column("varchar", { length: 15 })
    rol: string;
}