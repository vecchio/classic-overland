class Pic < ActiveRecord::Base

  belongs_to :picable, :polymorphic => true

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

  def is_type(type)
    picable_type == type
  end

  def stage_text
    if stage == 9
      'After'
    elsif stage == 5
      'While'
    elsif stage == 1
      'Before'
    else
      'Unknown'
    end
  end

  def set_signature_pic
    # t = picable
    if picable.pics.signature.count == 0
      picable.pics.not_signature.order(:updated_at).first.update_attribute(:is_signature, 1)
    end
  end

end
