class AddReferencesToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.belongs_to :host
    end
  end
end
