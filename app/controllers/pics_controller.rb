class PicsController < ApplicationController
  before_action :set_pic, only: [:update, :destroy]

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      @pic.set_signature_pic
      redirect_to car_path(@pic.picable_id, anchor: 'photos'), notice: 'Photo successfully saved.' if @pic.is_type('Car')
    end

  end

  def update
    if params[:is_signature]

      @pic.update_attribute(:is_signature, 0) if params[:is_signature] == 'false'

      if params[:is_signature] == 'true'
        @pic.picable.pics.signature.each do |p|
          p.update_attribute(:is_signature, 0)
        end
        @pic.update_attributes is_signature: 1, is_active: 1
      end

    end

    if params[:is_active]
      @pic.update_attributes is_signature: 0, is_active: 0 if @pic.is_active? && params[:is_active] == 'false'
      @pic.update_attribute(:is_active, 1) if params[:is_active] == 'true'
    end

    @pic.set_signature_pic

    if @pic.save
      redirect_to car_path(@pic.picable_id, anchor: 'photos'), notice: 'Photo successfully updated.' if @pic.is_type('Car')
    end
  end

  def destroy
    @pic.photo = nil
    if @pic.save
      if @pic.destroy
        @pic.set_signature_pic
        redirect_to car_path(@pic.picable_id, anchor: 'photos'), notice: 'Photo deleted.' if @pic.is_type('Car')
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
      params.require(:pic).permit(:photo, :name, :caption, :picable_id, :picable_type, :is_landscape, :stage)
    end
end
