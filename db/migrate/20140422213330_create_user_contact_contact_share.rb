class CreateUserContactContactShare < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true, uniqueness: true

      t.timestamps
    end

    create_table :contacts do |t|

      t.string :name, presence: true
      t.string :email, presence: true, uniqueness: true
      t.integer :user_id, presence: true

      t.timestamps
    end

    add_index :contacts, :user_id

    create_table :contact_shares do |t|
      t.integer :contact_id, presence: true
      t.integer :user_id, presence: true
    end

    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id

  end
end
