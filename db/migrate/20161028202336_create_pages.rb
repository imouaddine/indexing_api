class CreatePages < ActiveRecord::Migration[5.0]
  def change

    create_table :pages do |t|
      t.json :content
      t.string :url, index: true

      t.timestamps
    end
  end
end
