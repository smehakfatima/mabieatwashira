# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Adding Admin"
['ali@gmail.com', 'hassan@gmail.com'].each_with_index do |user, i|
  unless User.find_by_email(user)
    admin_user = User.new({email: user, password: '12345678', password_confirmation: '12345678',
                            name: "Admin #{i+1}", role: User.roles[:admin]})
    # admin_user.skip_confirmation!
    admin_user.save
  end
  User.create({email: "manager@gmail.com", password: '12345678', password_confirmation: '12345678',
            name: "Manager", role: User.roles[:manager]})
  User.create({email: "sales@gmail.com", password: '12345678', password_confirmation: '12345678',
                             name: "Sale Person", role: User.roles[:sales]})
end