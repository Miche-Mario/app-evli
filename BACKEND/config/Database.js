import { Sequelize } from "sequelize";



const db = new Sequelize('evlisms','root','Lostoflove90@', {
    dialect: "mysql",
    port: '3308'
});

export default db;