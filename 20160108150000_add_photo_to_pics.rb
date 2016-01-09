class AddPhotoToPics < ActiveRecord::Migration
  def up
    add_attachment :pics, :photo
  end

  def down
    remove_attachment :pics, :photo
  end
end