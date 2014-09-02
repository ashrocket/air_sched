ActiveAdmin.register ABBConfig do
  menu :parent => "Config"

  permit_params :var, :value, :thing_id, :thing_type, :tip

  form :partial => "form"
  # content do
  index do
      column :var
      column :value
      column :tip
      actions
  end

    # simple_form_for [:admin, @abb_config], html:{class: 'form-inline'} do |form|
    #
    #   case @abb_config.value.class.to_s.downcase
    #     when /string/
    #       render 'string', form: form
    #     when /float/
    #       render 'float', form: form
    #     when /fixnum/
    #       render 'fixnum', form: form
    #     else
    #       div :class => 'form-inputs' do
    #         form.input :var
    #         form.input :value
    #       end
    #       div :class => 'form-actions' do
    #         form.button :submit, 'Save'
    #       end
    #   end
    #
    #
    #
    # end

end
#


# ActiveAdmin.register_page "Config" do
#    content do
#      para "Hello World"
#      index do
#           column :value
#           column :var
#           default_actions
#      end
#    end
# end

# .container
#   %br
#   %br
#   .row.navbar.admin-nav
#     %ul.nav.navbar-nav
#       %li
#         %br
#       %li
#         %a{href:"#{root_url}"}<
#           = image_tag('icons/schedman_favicon.ico', size: "25x25")
#       %li
#         %a{href:"#{tuning_index_url}"}<
#           %i.fa.fa-gear
#       %li.nav-label
#         %a{href:"#"}<
#           System Config
#       %li
#         %a{href: "#{tuning_abb_config_index_url}", role:"button"} OAG Files
#       %li
#         %a{href: "#{tuning_oag_emails_url}", role:"button"} OAG Emails
#   %br
#   .row
#     .alert.alert-danger.alert-dismissable.hide
#       %button.close{type:"button", data:{dismiss:"alert"}, aria:{hidden:"true"}} &times
#       #alert-text
#   %br
#   .row
#     %br
#
#   - @abb_configs.each do |item|
#     .row
#       .col-sm-2
#         = item.value.class
#       .col-sm-2
#         = item.var
#       .col-sm-2
#         = item.value
#       -#.col-sm-2
#       -#  = item.thing_id
#       -#.col-sm-2
#       -#  = item.thing_type
#       .col-sm-2
#         = link_to 'Edit', edit_tuning_abb_config_path(item)
#
#   .row
#     %br
#   .row
#     .col-xs-6
#       -#= link_to 'New', new_tuning_abb_config_path