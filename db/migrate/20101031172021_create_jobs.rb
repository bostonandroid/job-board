class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :subject, :organization, :email, :phone
      t.text :description
      t.date :expires_on
      t.timestamps
    end
    add_index :jobs, :expires_on
  end

  def self.down
    drop_table :jobs
  end
end
