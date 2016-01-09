class PicsController < ApplicationController
  before_action :set_pic, only: [:update, :destroy]

  def create
    @pic = Pic.new(pic_params)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to car_path @pic.car_id, notice: 'pic was successfully created.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:is_signature]

      @pic.update_attribute(:is_signature, 0) if params[:is_signature] == 'false'

      if params[:is_signature] == 'true'
        Pic.signature.where(car_id: @pic.car_id).each do |p|
          p.update_attribute(:is_signature, 0)
          x = p
        end
        @pic.update_attributes is_signature: 1, is_active: 1
      end

    end

    if params[:is_active]
      @pic.update_attributes is_signature: 0, is_active: 0 if @pic.is_active? && params[:is_active] == 'false'
      @pic.update_attribute(:is_active, 1) if params[:is_active] == 'true'
    end

    @pic.set_signature_pic(@pic.car_id)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to car_path @pic.car_id, notice: 'Photo successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      end
    end
  end

  def destroy
    @pic.photo = nil
    if @pic.save
      if @pic.destroy
        @pic.set_signature_pic(@pic.car_id)
        respond_to do |format|
          format.html { redirect_to car_path @pic.car_id, notice: 'pic was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the spicy internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:photo,  :name, :caption, :car_id)
    end
end
