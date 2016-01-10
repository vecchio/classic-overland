module ApplicationHelper

  def header(text)
    content_for(:header) { text.to_s }
  end

  def get_sig_pic(obj)

    p = obj.pics.signature.first
    p = obj.pics.active.first unless p.present?
    u = p.present? ? p.photo.url : ''
    u = image_path('i-need-some-attention.jpg') unless u.present?
    u
  end

  def date_to_human(d)
    d.present? ? d.strftime('%d %b %Y') : 'tba . . .'
  end
end
