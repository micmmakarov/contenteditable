# This migration comes from contenteditable (originally 20120906212544)
class CreateContenteditableContents < ActiveRecord::Migration
  def change
    create_table :contenteditable_contents do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
