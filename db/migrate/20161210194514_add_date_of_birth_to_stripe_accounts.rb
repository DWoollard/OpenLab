class AddDateOfBirthToStripeAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :stripe_accounts, :date_of_birth, :date
  end
end
