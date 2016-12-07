module ApplicationHelper
  # something that realted to views goes here

  # gravatar url is based on the md5 hash of the user email address
  # ruby md5 is implemented using hexdigest method
  def gravatar_for(user, options= {size:80})
    if user.email
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.username, class:"img-circle")
    end
  end
end
