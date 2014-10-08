class CreateInterlineCxrRules < ActiveRecord::Migration
  def change
    create_table :interline_cxr_rules do |t|
      t.references :report_key, index: true
      t.text :markets, array: true, default: []
      t.text :combinations, array: true, default: []
      t.string :rule_kind, default: 'allow', null: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index  :interline_cxr_rules, :markets, using: 'gin'
    add_index  :interline_cxr_rules, :combinations, using: 'gin'
  end

end
