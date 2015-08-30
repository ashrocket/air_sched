class CreateInterlineCxrRules < ActiveRecord::Migration
  def change
    create_table :interline_cxr_rules do |t|
      t.references :report_key, index: true
      t.text :patterns, array: true, default: ['(?!)']
      t.string :match_on, default: 'id'
      t.string :rule_kind, default: 'allow', null: false
      t.boolean :active, default: true
      t.integer :sequence , default: 0;
      t.text :description
      t.timestamps
    end
  end

end
