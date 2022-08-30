require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  it 'product is valid' do
  @category = Category.create(name: "string")
  @product = Product.create(name: "string", price: 6, quantity: 6, category: @category)
    expect(@product).to be_valid
 
  end
  it 'presence of product name is false' do
    @category = Category.create(name: "string")
    @product = Product.create(price: 6, quantity: 6, category: @category)
        expect(@product.errors.full_messages).to include("Name can't be blank")
  end
    it 'presence of product price is false' do
      @category = Category.create(name: "string")
      @product = Product.create(name: "string", quantity: 6, category: @category)
            expect(@product.errors.full_messages).to include("Price can't be blank")
    end
      it 'presence of product quantiy is false' do
        @category = Category.create(name: "string")
        @product = Product.create(name: "string", price: 6, category: @category)
                expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
        it 'presence of product category is false' do
          @category = Category.create(name: "string")
          @product = Product.create(name: "string", price: 6, quantity: 6)
                    expect(@product.errors.full_messages).to include("Category can't be blank")
        end
  end

end
