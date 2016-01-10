class Car < ActiveRecord::Base
  has_many      :pics, :as  => :picable, :dependent => :destroy
  before_create :car_unique

  scope :shipped,    -> { where stage: 40 }
  scope :available,  -> { where('stage >= 40') }
  scope :future,     -> { where('stage < 40') }

  def selling_name
    sell_name.present? ? sell_name : name
  end

  def year_make_model
    "#{year} #{make} #{model}"
  end

  # def sig_pic_url
  #   p = pics.signature.first
  #   p = pics.active.first unless p.present?
  #   p.present? ? p.photo.url : ''
  # end




  private

  def car_unique
    if self.unique.nil?
      length = 9
      self.unique = Digest::SHA1.hexdigest(Time.now.to_s + rand.to_s).to_s[0..length].insert(5, '~').downcase
      car_unique unless Car.select('unique').find_by_unique(unique).nil?
    end
  end
end
