class CreateMultiProviderSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email 
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

    create_table :background_job_tracker do |t|
      t.string :job_id
      t.string :worker_name 
      t.integer :status 
      t.json :arguments 
      t.datetime :scheduled_at
      t.datetime :completed_at
      t.datetime :failed_at
      t.string :failure_reason 
      t.timestamps
    end 

    add_index :notification_provider_configs, :channel
  end
end
