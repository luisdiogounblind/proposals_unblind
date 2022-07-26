class CreateDealSections < ActiveRecord::Migration[7.0]
  def change
    create_table :deal_sections do |t|
      t.references :template, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :position, null: false, default: 0
      t.string :preHeading
      t.string :heading
      t.string :subHeading
      t.string :buttonSubtext
      t.json :theme
      t.json :background
      t.json :button
      t.json :button2
      t.json :links

      t.string :headingAlignment

      t.string :contentAlignment
      t.string :contentLayout
      t.string :contentStyle

      t.string :mediaAlignment
      t.string :mediaStyle

      t.timestamps
    end
  end
end
