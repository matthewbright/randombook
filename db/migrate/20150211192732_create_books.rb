class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string "author"
      t.string "title"
      t.string "isbn", :limit => 13
      t.string "bib", :limit => 8
      t.string "location"
      t.string "call_no"
      t.timestamps
    end
  end
end
