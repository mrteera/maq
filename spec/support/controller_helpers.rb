module ControllerHelpers
  def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow_current_user_and_return_nil
    else
      allow_current_user_and_return_user
    end
  end

  def allow_current_user_and_return_nil
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, scope: scope)
    allow(controller).to receive(current_user).and_return(nil)
  end

  def allow_current_user_and_return_user
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(current_user).and_return(user)
  end
end
