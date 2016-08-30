class RenameTokenSecretToSecret < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :token_secret, :secret
  end
end
