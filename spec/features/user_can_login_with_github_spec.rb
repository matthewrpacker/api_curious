require 'rails_helper'

# include Capybara::DSL
#   def setup
#     Capybara.app = ApiCurious::Application
#   end

RSpec.feature "UserCanLoginWithGithub", type: :feature do
  scenario "registered user visits root path" do
    visit '/'

    expect(status_code).to eq(200)

    # click_on 'Log in using GitHub'
    #
    # expect(current_path).to eq(dashboard_path)
    # expect(page).to have_content("Welcome")
    # expect(page).to have_content("Logout")
  end
end


# new_user.provider = auth_info.provider
# new_user.uid = auth_info.uid
# new_user.name = auth_info.info.name
# new_user.token = auth_info.credentials.token
# new_user.secret = auth_info.credentials.secret
# new_user.nickname = auth_info.info.nickname
# new_user.email = auth_info.info.email
# new_user.image_url = auth_info.info.image



# User visits the homepage
# User clicks the login link
# User should be redirected via twitter Oauth flow (which we will be stubbing out)
# User should end up on the homepage again
# User should now see their name displayed, along with a logout link
