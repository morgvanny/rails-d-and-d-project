class AddSecretPasswordToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :secret_password, :string
  end
end
