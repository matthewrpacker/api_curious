class Repo
  attr_reader :name, :html_url, :description, :updated_at

  def initialize(hash)
    @name = hash['name']
    @html_url = hash['html_url']
    @description = hash['description']
    @updated_at = hash['updated_at']
  end

  def updated_at
    date = DateTime.parse(@updated_at)
    formatted_date = date.strftime('%b %d, %Y')
  end
end
