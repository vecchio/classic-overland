class Pic < ActiveRecord::Base
  belongs_to :car

  scope :signature,     -> { where is_signature: 1 }
  scope :not_signature, -> { where is_active: 1, is_signature: 0 }
  scope :active,        -> { where is_active: 1 }

  has_attached_file :photo,
                    convert_options: { all: '-units PixelsPerInch -density 72 -strip -quality 100' },
                    :styles => {small:  '50x50#',
                                search: '100x100#',
                                medium: '384x216#',
                                large:  '1080x720#',
                                xlarge: '1920x1280#'},
                    default_url: '/images/:style/missing.png',
                    path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:filename'
                    # path: ':attachment/:id/:style.:extension'
                    # storage: :s3,
                    # bucket: APP_CONFIG['s3_bucket'],
                    # s3_credentials: {access_key_id: APP_CONFIG['s3_access_key_id'],
                    #                     secret_access_key: APP_CONFIG['s3_secret_access_key']},


  validates_attachment_content_type :photo, content_type: %w(image/jpeg image/pjpeg image/jpg image/png image/gif)

  def set_signature_pic(kar)
    k = Car.find(kar)
    if k.pics.signature.count == 0
      k.pics.not_signature.order(:updated_at).first.update_attribute(:is_signature, 1)
    end
  end

end
