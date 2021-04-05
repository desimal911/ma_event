ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      # span class: 'blank_slate' do
        # span I18n.t('active_admin.dashboard_welcome.welcome')
        # small I18n.t('active_admin.dashboard_welcome.call_to_action')
      # end
    end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Event" do
          ul do
            Event.last(5).map do |events|
              li link_to(events.title, admin_event_path(events))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.last(5).map do |users|
              li link_to("#{users.first_name} #{users.last_name}", admin_user_path(users))
            end
          end
        end
      end
    end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
   end
 end
