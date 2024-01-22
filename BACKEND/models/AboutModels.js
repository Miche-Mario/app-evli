
import { Sequelize } from "sequelize";
import db from '../config/Database.js';

const  {DataTypes} = Sequelize;

const About = db.define('about', {
    uuid:{
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    aboutname:{
        type: DataTypes.STRING,
        allowNull: false,
        validate:{
            notEmpty: true        }
    }
},{
    freezeTableName: true
})
export default About