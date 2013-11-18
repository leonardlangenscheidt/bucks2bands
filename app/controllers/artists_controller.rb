class ArtistsController < ApplicationController
	before_action :set_artist, only: [:show, :edit, :update, :destroy]

	# GET /artists
	# GET /artists.json
	def index
		@artists = Artist.all
		@count = @artists.last.cycle
	end

	# GET /artists/1
	# GET /artists/1.json
	def show
	end

	# GET /artists/new
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)

		respond_to do |format|
			if @artist.save
				format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
				format.json { render action: 'show', status: :created, location: @artist }
			else
				format.html { render action: 'new' }
				format.json { render json: @artist.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /artists/1/edit
	def edit
	end

	def update
		respond_to do |format|
			if @artist.update(artist_params)
				format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @artist.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /artists/1
	# DELETE /artists/1.json
	def destroy
		@artist.destroy
		respond_to do |format|
			format.html { redirect_to artists_url }
			format.json { head :no_content }
		end
	end

	def upvote
		if signed_in?
			@artist = Artist.find(params[:id])
			@user = current_user
			if @artist.cycle != Artist.last.cycle
				flash[:notice] = "Sorry. You can only vote for artists in the current matchup."
				redirect_to artists_path
			elsif @user.upvotes && @user.upvotes.last.artist.cycle == @artist.cycle
				flash[:notice] = "You have already voted for this matchup."
				redirect_to artists_path
			else
				@upvote = Upvote.create(
					:artist_id => @artist.id,
					:user_id => @user.id
					)
				flash[:notice] = "Successfully upvoted"
				redirect_to artists_path
			end
		else
			flash[:notice] = "To vote, sign in."
			redirect_to new_user_session_path
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_artist
			@artist = Artist.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def artist_params
			params.require(:artist).permit(:name, :label, :genre, :bio, :cycle)
		end
end
