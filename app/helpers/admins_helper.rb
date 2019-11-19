module AdminsHelper
  def admins_select
    Admin.all.map{|x| ["#{x.first_name}  #{x.second_name} #{x.patronymic}", x.id]}
  end
end
