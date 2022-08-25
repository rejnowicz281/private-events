class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.belongs_to :inviting
      t.belongs_to :invited
      t.belongs_to :event
      t.timestamps
    end
  end
end
