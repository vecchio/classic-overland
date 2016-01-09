class Car < ActiveRecord::Base
  has_many :pics, :as  => :picable, :dependent => :destroy

  scope :shipped,     -> { where stage: 40 }

  def sig_pic_url
    p = pics.signature.first
    p = pics.active.first unless p.present?
    p.present? ? p .photo.url : ''
  end
end
