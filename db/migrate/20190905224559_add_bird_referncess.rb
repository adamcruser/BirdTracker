class AddBirdReferncess < ActiveRecord::Migration[5.2]
  def change
        add_reference :sightings, :bird, index: true
  end
end
