	class RegistrationController < ApplicationController
		def create

			@member = Member.new
			@member.name = params[:member][:name]
			@member.email = params[:member][:email]
			@member.password = params[:member][:password]
			@member.password_confirmation =params[:member][:password_confirmation]

			
			@member.valid?
			if @member.errors.blank?

				@member.save
				
				redirect_to dashboard_path
				
			end
		end

	end
