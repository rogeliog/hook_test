class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :author
      t.text :message
      t.text :url
      t.datetime :time
      t.boolean :notified, default: :boolean

      t.timestamps
    end
  end
end
