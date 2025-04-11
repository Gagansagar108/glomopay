class CreateMultiProviderSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.streing :email 
      t.string :phone
      t.string :country_code 
      t.boolean :status
      t.timestamps
    end

    add

    create_table :notifications do |t|
      t.references :user
      t.string :message 
      t.string :channel 
      t.string :provider 
      t.string :status 
      t.timestamps
    end 

    create_table :notification_provider_configs do |t|
      t.string :channel
      t.string :name 
      t.json :config_data 
      t.boolean :status
      t.timestamps
    end 

    add_index :notification_provider_configs, :channel
  end
end
