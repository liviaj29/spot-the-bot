class CreateEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :emails do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
