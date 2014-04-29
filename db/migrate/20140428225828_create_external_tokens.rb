class CreateExternalTokens < ActiveRecord::Migration
  def change
    create_table :external_tokens do |t|
      t.references :user, index: true
      t.string :token
      t.string :provider

      t.timestamps
    end
  end
end
