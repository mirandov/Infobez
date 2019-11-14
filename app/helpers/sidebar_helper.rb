module SidebarHelper
  def side_bar_items
    result = []
    if current_user != nil
      result << {
        :name => t('sidebar.people'),
        :icon => 'address-card-o',
        :controller => :people,
        :action => :index
      }

      # result << {
      #   :name => t('sidebar.check_lists'),
      #   :icon => 'cart-arrow-down',
      #   :controller => :check_lists,
      #   :action => :index
      # }
      #
      # result << {
      #   :name => t('sidebar.admins'),
      #   :icon => 'user',
      #   :controller => :admins,
      #   :action => :index
      # }
    end

    result
  end

  def is_open?(ctr)
    ctr.to_s == controller_name.to_s
  end
end
