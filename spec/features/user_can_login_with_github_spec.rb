require 'rails_helper'

RSpec.feature "UserCanLoginWithGithub", type: :feature do
  scenario "registered user visits root path" do
    visit '/'

    expect(status_code).to eq(200)
  end
end
