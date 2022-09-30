class AddFieldsToItineraries < ActiveRecord::Migration[6.0]
  def change
    add_column :desfake_itineraries, :body, :jsonb, null: false, default: {}
    add_column :desfake_itineraries, :published, :boolean, null: false, default: false
    add_column :desfake_itineraries, :position, :integer, null: false, default: 1
    add_column :desfake_itineraries, :subscription, :integer, null: false, default: 0
  end
end
