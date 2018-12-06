module UsersHelper

  def get_gravatar_url(email)
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}?d=retro"
    return image_src
  end

end
