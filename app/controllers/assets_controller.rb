class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.all
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  # POST /assets.json
  def create
    # todo : modify Asset.new that it just takes params and works with scaffold controllers
    # virtuelle attribute die nicht in die db kommen + validations
    asset_type = {
        "image" => Image,
        "video" => Video
    }; asset_type = asset_type[params[:asset_type]]
    raise "illegal asset_type:" + params[:asset_type].to_s unless asset_type

    @asset = asset_type.new
    @asset.file = params[:file]

    if params[:linker_type] && params[:linker_id] && params[:linker_attr]
      @asset.asset_links.build(linker_id: params[:linker_id],
                                     linker_type:params[:linker_type].capitalize,
                                     linker_attr:params[:linker_attr])
    end

    respond_to do |format|
      if @asset.save
        format.html { redirect_to pages_path, notice: 'Asset was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:name, :image, :gallery_image, :video);
      params.permit(:file, :asset_type, :linker_attr,  :linker_id, :linker_type);
    end
end
