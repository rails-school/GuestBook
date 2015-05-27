class FixJsColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :guestbook_jsx, :guestbook_js
  end
end
