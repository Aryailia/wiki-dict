class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :content
      t.references :sense, foreign_key: true

      t.timestamps
    end
  end
end
