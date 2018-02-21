require "rails_helper"

describe Cart, type: :model do
  describe "#total_count" do
    it "returns total count of items from cart" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_count).to eq(5)
    end
  end

  describe "#add_movie" do
    it "increases count of movie by id" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.contents).to eq({"1" => 2, "2" => 3})

      cart.add_movie("1")
      cart.add_movie("2")
      expect(cart.contents).to eq({"1" => 3, "2" => 4})
    end

    it "handles default nil" do
      cart = Cart.new(nil)
      
      cart.add_movie("1")
      expect(cart.contents).to eq("1" => 1)
    end
  end
end
