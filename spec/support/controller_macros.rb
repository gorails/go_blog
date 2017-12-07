module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user_with_cpf]
      @current_user = FactoryBot.create(:user_with_cpf)
      sign_in @current_user
    end
  end

end
