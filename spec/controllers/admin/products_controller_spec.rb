require 'rails_helper'
include AuthHelper

RSpec.describe Admin::ProductsController, type: :controller do
  let(:admin){ FactoryBot.create(:user, role: "admin") }
  let(:product){ FactoryBot.create :product }
  let(:category){ FactoryBot.create :category }

  before do
    log_in admin
  end

  describe "GET admin/products#index" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET admin/products#new" do
    it "render new page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST admin/products#create" do
    context "with valid attributes" do
      let!(:product_params) {
        FactoryBot.attributes_for :product,
        :category_id => category.id
      }

      before do
        post :create, params:{product: product_params}
      end

      it "should create new product" do
        change{Product.count}.by 1
      end

      it "should flash success" do
        expect(flash[:success]).to eq I18n.t("admin.products.create.success")
      end

      it "should create new product reponse" do
        expect(response).to redirect_to admin_products_path
      end
    end

    context "with invalid attributes" do
      before do
        post :create,params:{product: {name: ""}}
      end

      it "does not save new product" do
        change{Product.count}.by 0
      end

      it "Create failed and show flash" do
        expect(flash[:danger]).to eq I18n.t("admin.products.create.fail")
      end

      it "Create failed and render new view" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET admin/products#edit" do
    before do
      allow(Product).to receive(:find).and_return(product)
    end

    it "render edit page" do
      get :edit, params:{
        id: product.id
      }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "PATCH admin/products#update" do
    before do
      allow(Product).to receive(:find).and_return(product)
    end

    context "with invalid attributes" do
      before do
        patch :update, params:{
          id: product.id,
          product: {
            name: product.name
          }
        }
      end

      it "Update successfully and show flash" do
        expect(flash[:success]).to eq I18n.t("admin.products.update.alert_success_update")
      end

      it "Update successfully and redirect page" do
        expect(response).to redirect_to(admin_products_path)
      end
    end

    context "with invalid attributes" do
      before do
        patch :update, params:{
          id: product.id,
          product: {
            name: ""
          }
        }
      end

      it "Update failed and show flash" do
        expect(flash[:danger]).to eq I18n.t("admin.products.update.alert_err_update")
      end

      it "Update failed and render edit view" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE admin/products#destroy" do
    before do
      allow(Product).to receive(:find).and_return(product)
    end

    context "When delete successful" do
      before do
        allow(product).to receive(:destroy).and_return(true)
      end

      it do
        delete :destroy, params: { 
          id: product.id 
        }
        response.header['Content-Type'].should include 'application/json'
        expect(response.body).to match(
          {
            :message => I18n.t("admin.products.destroy.alert_success_destroy"),
            :status => 200
          }.to_json
        )
      end
    end

    context "When delete fail" do
      before do
        allow(product).to receive(:destroy).and_return(false)
      end

      it do
        delete :destroy, params: { 
          id: product.id 
        }
        response.header['Content-Type'].should include 'application/json'
        expect(response.body).to match(
          {
            :message => I18n.t("admin.products.destroy.alert_err_destroy"),
            :status => 404
          }.to_json
        )
      end
    end
  end
end
