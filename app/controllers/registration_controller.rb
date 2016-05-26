	class RegistrationController < ApplicationController
		def create

			@member = Member.new
			@member.name = params[:member][:name]
			@member.email = params[:member][:email]
			@member.password = params[:member][:password]
			@member.password_confirmation =params[:member][:password_confirmation]
			byebug
			if !(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/ =~ @member.email).nil?

				if @member.valid?
					if @member.errors.blank?

						@member.save
						sign_in(@member)

						redirect_to url_for(:controller => :home, :action => :list)
					end
				else

					redirect_to url_for(:controller => :home, :action => :index)
				end
			else
				redirect_to url_for(:controller => :home, :action => :index)
			end

		end

		def delete
			s_feed=Subscribe.select(:id).where("user_id=?",current_member.id)
			Subscribe.delete(s_feed)
			Member.delete(current_member.id)
			redirect_to url_for(:controller => :members, :action => :sign_up)
		end
		


	end
