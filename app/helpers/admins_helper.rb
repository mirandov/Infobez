module AdminsHelper
  def admins_select
    Admin.all.map{|x| [x.second_name, x.id]}
  end
end
