class Users < ActiveRecord::Migration[7.0]
  def change
	create_table "users", id: :integer,name: :string, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
  end
end
