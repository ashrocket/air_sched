class CollectionRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def item_wrapper_class
    "radio-inline"
  end
  #def item_wrapper_class
  #    super.push('btn-group')
  #end

end