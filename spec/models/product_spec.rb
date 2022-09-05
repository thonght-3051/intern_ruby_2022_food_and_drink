require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product){ FactoryBot.create(:product) }
  let!(:product_1){ FactoryBot.create(:product) }
  describe "associations" do
    context "with belong to" do
      it {is_expected.to belong_to(:category) }
    end

    context "with has many" do
      it { is_expected.to have_many(:votes).dependent(:destroy) }
      it { is_expected.to have_many(:product_attributes).dependent(:destroy) }
      it { is_expected.to have_many(:product_images).dependent(:destroy) }
    end
  end

  describe "validations" do
    context "when validate attributes" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
      it { is_expected.to validate_length_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_length_of(:description) }
    end
  end

  describe "scopes" do
    context "with scopes sort" do
      it { expect(Product.latest_product).to eq([product_1, product]) }
    end
  end

  describe "delegate" do
    context "with delegate category" do
      it { should delegate_method(:name).to(:category).with_prefix(true) }
    end
  end

  describe "#sum_quantity" do
    context "when calculator quantity" do
      it do
        expect(product.sum_quantity).to eq(0)
      end
    end
  end
end
