class AddStripeCustomerTokenToUsersCustom < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_customer_tokens, :string
  end
end
