require "rails_helper"

describe Cart, type: :model do
  describe "#total_count" do
    it "returns total count of items from cart" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_count).to eq(5)
    end
  end
end
