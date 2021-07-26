require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'creates a valid product' do
      category = Category.create(name: "Armour")
      product = Product.create(
        name:"boots",
        price: 69.00,
        quantity: 3,
        category: category
      )
      expect(product).to be_present
    end
    it 'attempts to create category with null name' do
      category = Category.create(name: "Armour")
      product = Product.create(
        name: nil,
        price: 69.00,
        quantity: 3,
        category: category
      )
      expect(product.errors.full_messages).to include "Name can't be blank"
    end
    it 'attempts to create category with null price' do
      category = Category.create(name: "Armour")
      product = Product.create(
        name: "helmet",
        price: nil,
        quantity: 3,
        category: category
      )
      expect(product.errors.full_messages).to include "Price can't be blank"
    end
    it 'attempts to create category with null quantity' do
      category = Category.create(name: "Armour")
      product = Product.create(
        name: "helmet",
        price: 43.00,
        quantity: nil,
        category: category
      )
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'attempts to create category with null category' do
      category = Category.create(name: "Armour")
      product = Product.create(
        name: "helmet",
        price: 43.00,
        quantity: 3,
        category: nil
      )
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
