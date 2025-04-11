class CreateMultiProviderSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :multi_provider_schemas do |t|
      t.timestamps
    end
  end
end
