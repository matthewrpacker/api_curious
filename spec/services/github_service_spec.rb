require 'rails_helper'

describe GithubService do
  context "#user_info" do
    it "returns parsed user info"do
      VCR.use_cassette("github_service_user_info") do
        raw_data = User.new(
          id: 1,
          provider: "github",
          uid: "14930925",
          name: "matthewrpacker",
          created_at: "2016-08-31 00:14:20",
          updated_at: "2016-08-31 00:14:20",
          token: "2bc43af87bfe48eab5f39114015b934fc6275a36",
          secret: nil,
          nickname: "matthewrpacker",
          email: nil,
          image_url: "https://avatars.githubusercontent.com/u/14930925?v"
        )

        user = GithubService.new(raw_data)

        expect(user.user_info.count).to eq(30)
        expect(user.login_name).to eq('matthewrpacker')
        expect(user.followers).to eq(2)
        expect(user.following).to eq(0)
        expect(user.public_repos_count).to eq(25)
        expect(user.repos_url).to eq("https://api.github.com/users/matthewrpacker/repos")
        expect(user.public_gists_count).to eq(3)
        expect(user.gists_url).to eq("https://api.github.com/users/matthewrpacker/gists{/gist_id}")
        expect(user.avatar_url).to eq("https://avatars.githubusercontent.com/u/14930925?v=3")
      end
    end
  end
end
