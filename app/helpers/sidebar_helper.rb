module SidebarHelper
  def side_bar_items
    result = []

    result << {
      :name => t('sidebar.modular_exponentiation'),
      :icon => 'diamond',
      :controller => :quick_pows,
      :action => :index
    }

    result << {
      :name => t('sidebar.rc4'),
      :icon => 'diamond',
      :controller => :rc4_programs,
      :action => :index
    }

    result << {
      :name => t('sidebar.h_value'),
      :icon => 'diamond',
      :controller => :excess_definitions,
      :action => :index
    }

    result
  end

  def is_open?(ctr)
    ctr.to_s == controller_name.to_s
  end
end
