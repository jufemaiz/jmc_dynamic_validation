class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.text          :text,              :null => false
      t.references    :question
      t.timestamps
    end
  end

  def self.down
    drop_table        :responses
  end
end
