class LoginPage < SitePrism::Page

    set_url ''
    element :email_field, :id, "email"
    element :password_field, :id, "pass"
    element :login_button, :css, "button[name='login']"
  
    def userLogin(email, password)
      email_field.set (email)
      password_field.set (password)
      login_button.click
    end
  
  end
  