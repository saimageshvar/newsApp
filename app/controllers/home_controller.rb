class HomeController < ApplicationController
	def index
		@feeds=Feed.where("id in (select feed_id from subscribes where user_id=?)",current_member.id)
		@categories=Category.all
	end

	def list
		@categories=Category.all
		@feeds=Feed.all

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
end
