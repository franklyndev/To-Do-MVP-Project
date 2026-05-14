'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Task extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Task.belongsTo(models.User, {
        foreignKey: 'user_id'
      });

      Task.belongsTo(models.Category, {
        foreignKey: 'category_id'
      });
    }
  }
  Task.init({
    user_id: DataTypes.INTEGER,
    category_id: DataTypes.INTEGER,
    title: DataTypes.STRING,
    description: DataTypes.STRING,
    completed: DataTypes.BOOLEAN,
    priority: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Task',
    tableName: 'tasks',
  });
  return Task;
};
