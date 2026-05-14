'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Category extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Category.belongsTo(models.User, {
        foreignKey: 'user_id'
      });

      Category.hasMany(models.Task, {
        foreignKey: 'category_id'
      });
    }
  }
  Category.init({
    name: DataTypes.STRING,
    user_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Category',
    tableName: 'categories',
  });
  return Category;
};
