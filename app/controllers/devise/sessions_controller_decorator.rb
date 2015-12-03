Devise::SessionsController.class_eval do

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    resource.image = Asset::UserImage.new unless resource.image

    respond_with resource, location: after_sign_in_path_for(resource)
  end

end