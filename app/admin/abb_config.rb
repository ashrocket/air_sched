# ActiveAdmin.register AbbConfig :as => "Data Key" do
#
#   content do
#       columns do
#         column do
#           panel "Data Key" do
#             render "index"
#
#           end
#
#         end
#       end
#       # renders app/views/admin/posts/_some_partial.html.erb
#     end
#
#
#
# end

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