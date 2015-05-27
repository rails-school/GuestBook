class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :guestbook_jsx

      t.timestamps null: false
    end
  end
end
