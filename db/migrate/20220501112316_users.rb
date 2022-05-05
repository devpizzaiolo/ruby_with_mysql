class Users < ActiveRecord::Migration[7.0]
  def change
	create_table "users", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
	end
	add_column :users, :name, :string
	add_column :users, :password_digest, :text
	
  end
end