class HomeController < ApplicationController
	def index
		@categories=Category.all
		@languages = Language.all
		if member_signed_in?
			if params[:lang].nil? and params[:select].nil?
				@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?)",current_member.id)
			elsif params[:lang]==""
				@id = params[:select]
				
				if @id=="0" or @id=="" or @id.nil?

					@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?)",current_member.id)
				else
					@feeds=Feed.where("c_id = ? and id in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
				end

			elsif params[:select]==""
				@lang = params[:lang]

				if @lang=="all" or @lang==""
					@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?)",current_member.id)
				else
					@language=@languages.where("name=?",@lang)
					@feeds=Feed.where("lang_id = ? and id in (select feed_id from subscribes where user_id=?)", @language.ids[0],current_member.id)	
				end
			else
				@id = params[:select]
				@lang = params[:lang]
				@language=@languages.where("name=?",@lang)

				if @id=="0"
					if @lang == "all"
						@feeds=Feed.where("id  in (select feed_id from subscribes where user_id=?)",current_member.id)
					else
						@feeds=Feed.where("lang_id = ? and id in (select feed_id from subscribes where user_id=?)", @language.ids[0],current_member.id)	
					end	
				else
					if @lang == "all"	
						@feeds=Feed.where("c_id = ? and id in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
					else

						@feeds=Feed.where("c_id = ? and id in (select feed_id from subscribes where user_id=? ) and lang_id=?", @id,current_member.id,@language.ids[0])

					end
				end
			end
		else
			redirect_to url_for(:controller => :members, :action => :sign_up)
		end
	end

	def list
		@categories=Category.all
		@languages = Language.all
		if member_signed_in?
			if params[:lang].nil? and params[:select].nil?
				@feeds=Feed.where("id  not in (select feed_id from subscribes where user_id=?)",current_member.id)
			elsif params[:lang]==""
				@id = params[:select]
				
				if @id=="0" or @id=="" or @id.nil?

					@feeds=Feed.where("id not in (select feed_id from subscribes where user_id=?)",current_member.id)
				else
					@feeds=Feed.where("c_id = ? and id not in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
				end

			elsif params[:select]==""
				@lang = params[:lang]

				if @lang=="all" or @lang==""
					@feeds=Feed.where("id not in (select feed_id from subscribes where user_id=?)",current_member.id)
				else
					@language=@languages.where("name=?",@lang)
					@feeds=Feed.where("lang_id = ? and id not in (select feed_id from subscribes where user_id=?)", @language.ids[0],current_member.id)	
				end
			else
				@id = params[:select]
				@lang = params[:lang]
				@language=@languages.where("name=?",@lang)

				if @id=="0"
					if @lang == "all"
						@feeds=Feed.where("id not in (select feed_id from subscribes where user_id=?)",current_member.id)
					else
						@feeds=Feed.where("lang_id = ? and id not in (select feed_id from subscribes where user_id=?)", @language.ids[0],current_member.id)	
					end	
				else
					if @lang == "all"	
						@feeds=Feed.where("c_id = ? and id not in (select feed_id from subscribes where user_id=?)", @id,current_member.id)	
					else

						@feeds=Feed.where("c_id = ? and id not in (select feed_id from subscribes where user_id=? ) and lang_id=?", @id,current_member.id,@language.ids[0])

					end
				end
			end
		else
			redirect_to url_for(:controller => :members, :action => :sign_up)
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
		@subscribe.rate="f"
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
