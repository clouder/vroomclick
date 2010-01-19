# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :title => 'Chicago' }, { :title => 'Copenhagen' }])
#   Major.create(:title => 'Daley', :city => cities.first)

Car.destroy_all
Image.destroy_all
User.destroy_all

[{:title => '2004 Maserati MC12'},
 {:title => '2006 Bugatti 16/4 Veyron', :description => 'September 3rd 2005, Monterey, California - After years of applause, celebration, doubt, then ridicule, the first production Bugatti Veyron has hit the road as the fastest available supercar. Bugatti has little to be embarrassed about since the 16/4 is very similar to the extreme proposals made in 1999.'},
 {:title => '2003 Porsche Carrera GT', :description => "Released at the 2003 Geneva Auto Show, Porsche's Carrera GT was a final production version of the concept car first seen at the 2001 Paris Auto Salon. It was Porsche's first limited production supercar since 959 production stopped in 1988. At the time of launch, it was one of the few available products that rivaled the Ferrari Enzo."},
 {:title => '2002 Ferrari Enzo'},
 {:title => '2005 Pagani Zonda F'},
 {:title => '2002 Lamborghini Murcielago'}].each do |v|
   Car.create(v)
 end
 
 Car.all.each do |c|
   rand(10).times do
     f = File.open(File.join(Rails.root, 'test', 'fixtures', 'files', "lambo#{rand(4)}.jpg"))
     i = c.images.new
     i.image = f
     i.save
   end
 end
 
 User.create(:username => 'admin', :password => 'admin', :password_confirmation => 'admin')