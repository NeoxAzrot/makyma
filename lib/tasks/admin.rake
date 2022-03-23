namespace :makyma do
	desc "Admin Create"
	task admin: :environment do

		puts "Create admin user"

		admin=User.new({email: "#{ENV['ADMIN_EMAIL']}",
		password: "#{ENV['ADMIN_PASSWORD']}", password_confirmation: "#{ENV['ADMIN_PASSWORD']}", admin_role: true})


		if admin.valid?
			admin.save()
			puts "> MAKYMA ADMIN CREATED : email = #{ENV['ADMIN_EMAIL']} and password = #{ENV['ADMIN_PASSWORD']}"

		elsif admin.errors.any?
			admin.errors.full_messages.each do |msg|
			puts msg
		end
		else
			puts "****NOT VALID****"
		end
	end 
end
