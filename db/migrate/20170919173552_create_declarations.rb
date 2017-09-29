class CreateDeclarations < ActiveRecord::Migration[5.1]
  def change
    create_table :declarations do |t|
      t.string :declaration_name
      t.text :description

      t.timestamps
    end
  end
end
