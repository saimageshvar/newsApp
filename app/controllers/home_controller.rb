class HomeController < ApplicationController
	def index
		@categories=Category.all
		@languages = Language.all
		if member_signed_in?
			if params[:lang].nil?
				@id = params[:select]
				if @lang=="all" or @lang.nil?
					if @id=="0" or @id.nil?
						@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?)",current_member.id)
					else
						@feeds=Feed.where("c_id = ? and id in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
					end
				else
					@language=@languages.where("name=?",@lang)
					if @id==0
						@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?) and lang_id=?",current_member.id,@language.id)
					else
						@feeds=Feed.where("c_id = ? and id in (select feed_id from subscribes where user_id=? and lang_id=?)", @id,current_member.id,@language.id)	
					end
				end
			elsif params[:select].nil?

			end
		else
			redirect_to url_for(:controller => :members, :action => :sign_up)
		end
	end

	def list
		@categories=Category.all

		@id = params[:select]
		if @id.nil?
			@feeds=Feed.where("id not in (select feed_id from subscribes where user_id=?)",current_member.id)
		else
			@feeds=Feed.where("c_id = ? and id not in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
		end

	end


	def display
		id = params[:select]
		@feeds=Feed.where("c_id = ? and id not in (select feed_id from subscribes where user_id=?)", id,current_member.id)
	end

	def add
		feed_id = params[:feed_id]
		@subscribe=Subscribe.new
		@subscribe.user_id=current_member.id
		@subscribe.feed_id=feed_id
		@subscribe.save
		if @subscribe.save
			redirect_to(:back)
		end
	end

	def delete
		feed_id = params[:feed_id]
		@feed=Subscribe.where("feed_id = ? and user_id = ?", feed_id, current_member.id)
		@feed.destroy_all
		redirect_to(:back)

	end

	def logout
		sign_out(@member)
		redirect_to url_for(:controller => :home, :action => :index)
	end
end
