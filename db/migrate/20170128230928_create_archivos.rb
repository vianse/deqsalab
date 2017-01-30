class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :fecha
      t.string :folio
      t.string :cliente
      t.string :photo
      t.string :referencia
      t.string :nombre

      t.timestamps null: false
    end
  end
end
