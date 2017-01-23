class CreatePerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :perfiles do |t|
    	
    	# :user_id es el campo de relacion con la BD Users
    	t.integer :user_id, :null => false
    	t.string :nombre
    	t.string :apellidos
    	t.string :sexo
    	t.date :fecha_nacimiento
    	t.string :ciudad

      t.timestamps
    end
  end
end
