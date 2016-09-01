require 'rails_helper'

describe GithubService do
  context "#user_info" do
    it "returns parsed user info"do
      VCR.use_cassette("github_service_user_info") do
        current_user = User.new(
          id: 1,
          provider: "github",
          uid: "14930925",
          name: "matthewrpacker",
          created_at: "2016-08-31 00:14:20",
          updated_at: "2016-08-31 00:14:20",
          token: "2bc43af87bfe48eab5f39114015b934fc6275a36",
          nickname: "matthewrpacker",
          image_url: "https://avatars.githubusercontent.com/u/14930925?v"
        )

        github = GithubService.new(current_user)
        user_info = UserInfo.new(github.user_info)
        github.starred_info
        github.repos_info

        bundler_repo = github.repos[4]

        expect(user_info.name).to eq("Matt Packer")
        expect(user_info.followers).to eq(2)
        expect(user_info.following).to eq(0)
        expect(user_info.bio).to eq("Enrolled at Turing School of Software & Design")
        expect(user_info.member_since).to eq("Oct 01, 2015")
        expect(user_info.location).to eq("Denver, CO")

        expect(github.starred_count).to eq(2)
      end
    end
  end

  context "#repos_info" do
    it "returns parsed repo info" do
      VCR.use_cassette("github_service_user_info") do
        current_user = User.new(
          id: 1,
          provider: "github",
          uid: "14930925",
          name: "matthewrpacker",
          created_at: "2016-08-31 00:14:20",
          updated_at: "2016-08-31 00:14:20",
          token: "2bc43af87bfe48eab5f39114015b934fc6275a36",
          nickname: "matthewrpacker",
          image_url: "https://avatars.githubusercontent.com/u/14930925?v"
        )

        github = GithubService.new(current_user)
        github.repos_info

        bundler_repo = github.repos[4]

        expect(github.repos.class).to eq(Array)
        expect(github.repos.count).to eq(25)
        expect(bundler_repo.name).to eq("bundler")
        expect(bundler_repo.html_url).to eq("https://github.com/matthewrpacker/bundler")
        expect(bundler_repo.description).to eq("Manage your application's gem dependencies with less pain")
        expect(bundler_repo.updated_at).to eq("Jul 21, 2016")
      end
    end
  end

  context "#starred_info" do
    it "returns parsed starred repository info" do
      VCR.use_cassette("github_service_user_info") do
        current_user = User.new(
          id: 1,
          provider: "github",
          uid: "14930925",
          name: "matthewrpacker",
          created_at: "2016-08-31 00:14:20",
          updated_at: "2016-08-31 00:14:20",
          token: "2bc43af87bfe48eab5f39114015b934fc6275a36",
          nickname: "matthewrpacker",
          image_url: "https://avatars.githubusercontent.com/u/14930925?v"
        )

        github = GithubService.new(current_user)
        github.starred_info

        expect(github.starred_count).to eq(2)
      end
    end
  end
end
