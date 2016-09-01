class Activity
  attr_reader :type, :created_at, :repo_name, :commits

  def initialize(hash)
    @type = hash['type']
    @created_at = hash['created_at']
    @repo_name = hash['repo']['name']
    @commits = hash['payload']['size']
  end

  def created_at
    date = DateTime.parse(@created_at)
    formatted_date = date.strftime('%b %d, %Y')
  end
end
