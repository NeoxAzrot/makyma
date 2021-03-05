namespace :makyma do
	desc "Admin Create"
	task create_admin: :environment do

		puts "Create admin user"

		admin=User.new({email: 'makymaorg@gmail.com',
		password: 'Makyma33!', password_confirmation: 'Makyma33!', admin_role: true})


		if admin.valid?
			admin.save()
			puts "****MAKYMA ADMIN CREATED : email = makymaorg@gmail.com and password = Makyma33!****"

		elsif admin.errors.any?
			admin.errors.full_messages.each do |msg|
			puts msg
		end
		else
			puts "****NOT VALID****"
		end
	end 
end
