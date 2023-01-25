class AddItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :desfake_itineraries do |t|
      t.jsonb :title, null: false
      t.jsonb :subtitle, null: false
      t.jsonb :description, null: false
      t.references :decidim_organization,
                   foreign_key: true,
                   index: { name: "index_desfake_itineraries_on_decidim_organization_id" }
      t.timestamps
    end

    create_join_table :decidim_participatory_process, :desfake_itineraries
  end
end
