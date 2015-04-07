module Etsy
  class Transaction
    include Model

    attribute :id, :from => :transaction_id
    attribute :buyer_id, :from => :buyer_user_id
    attribute :creation, :from => :creation_tsz
    attributes :quantity, :listing_id, :title,
               :description, :price, :currency_code,
               :tags, :materials, :image_listing_id,
               :receipt_id, :shipping_cost, :is_digital,
               :file_data, :listing_id, :is_quick_sale,
               :seller_feedback_id, :buyer_feedback_id,
               :transaction_type, :url, :variations

    def self.find_all_by_shop_id(shop_id, options = {})
      get_all("/shops/#{shop_id}/transactions", options)
    end

    #Find all Transactions by the buyer_id
    #
    def self.find_all_by_buyer_id(user_id, options = {})
      get_all("/users/#{user_id}/transactions", options)
    end

    def buyer
      @buyer ||= User.find(buyer_id)
    end

  end
end