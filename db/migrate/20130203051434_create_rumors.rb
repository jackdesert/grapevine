class CreateRumors < ActiveRecord::Migration
  def change
    create_table :rumors do |t|
      t.string :headline
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end
