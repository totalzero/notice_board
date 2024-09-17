class NoticesController < ApplicationController
include UsersHelper
include NoticesHelper
  before_action :set_notice, :set_categories, only: %i[ show edit update destroy ]
before_action :required_login, only: %i[new create edit update destroy]
before_action :require_owner, only: %i[edit update destroy]
  # GET /notices or /notices.json
  def index
    @notices = Notice.all
  end

  # GET /notices/1 or /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = current_user.notices.build
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices or /notices.json
  def create
    @notice = current_user.notices.build(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully created." }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1 or /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully updated." }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1 or /notices/1.json
  def destroy
    @notice.destroy!

    respond_to do |format|
      format.html { redirect_to notices_url, notice: "Notice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.require(:notice).permit(:title, :body, :category_id)
    end

    def require_owner
      unless notice_owner?(current_user, @notice)
        redirect_to root_path
      end
    end
    def set_categories
      @categories = []
      Category.all.each do |cat|
        @categories.push([cat.name, cat.id])
      end
    end
end
