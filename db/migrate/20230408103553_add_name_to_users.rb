class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    # nameはnollを許容せずに，20文字までの文字列
    add_column :users, :name, :string, null: false, limit: 20
  end
end
