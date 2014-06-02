class CreateOagMail < ActiveRecord::Migration
  def change
    create_table :oag_mails do |t|
      t.string :uid
      t.string :validation_uid
      t.text :envelope
      t.text :header
      t.text :rfc_822_header
      t.text :attachment_info
    end


  end
end
