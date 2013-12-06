class UsersController < ApplicationController

	def index
		@user =Users.all
		respond_to do |format|
			format.html
			format.json{render json:@user}
		end
	end

	def show
		@user=Users.find(params[:id])
		respond_to do |format|
			format.html
			format.json{render json:@user}
		end
	end

	def new
		 @user = Users.new
    	respond_to do |format|
	      	format.html # new.html.erb
	      	format.json { render json: @user }
    	end
	end

	def edit
		@user=Users.find(params[:id])
		respond_to do |format|
	      	format.html # new.html.erb
	      	format.json { render json: @user }
	      end
	end

	def create
		@user = Users.new(params[:users])
		respond_to do |format|
			if @user.save
				 format.html { redirect_to @user, notice: 'User was successfully created.' }
        		format.json { render json: @user, status: :created, location: @user }
        	else
        		format.html { render action: "new" }
       			 format.json { render json: @user.errors, status: :unprocessable_entity }
       		end
       	end
	end

	def update
		puts "@ params: #{params} tuan"
		@user =Users.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(params[:users])
			   format.html { redirect_to @user, notice: 'User was successfully updated.' }
        		format.json { head :no_content }
	     	 else
	       		 format.html { render action: "edit" }
	       	 	format.json { render json: @user.errors, status: :unprocessable_entity }
	     	 end
    	end
  	end

	  	def destroy
		  	@user =Users.find(params[:id])
		  	@user.destroy
		  	respond_to do |format|
		  		format.html{redirect_to users_url}
		  		format.json{head :no_content}
		  	end
	  end
end