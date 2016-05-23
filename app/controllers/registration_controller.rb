	class RegistrationController < ApplicationController
		def create

			@member = Member.new
			@member.name = params[:member][:name]
			@member.email = params[:member][:email]
			@member.password = params[:member][:password]
			@member.password_confirmation =params[:member][:password_confirmation]

			if (/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/ =~ @member.email) == @member.email.length

				@member.valid?
				if @member.errors.blank?

					@member.save

					redirect_to dashboard_path

				end
			else
				redirect_to url_for(:controller => :home, :action => :index)
			end

		end

	end
