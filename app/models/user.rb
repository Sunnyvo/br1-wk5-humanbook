class User < ApplicationRecord
  validates :name, :email, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_secure_password
  
  def image_url_or_default
    image_url.presence || "http://lorempixel.com/400/200/sports/Dummy-Text/"
  end
  
  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end
  
  def add_friend(another)
    unless friendships.find_by(friend: another)
      friendships.create(friend: another)
    end 
  end
  
  def is_friend?(another)
    friendships.find_by(friend: another) ? true : false
  end
  
  def remove_friend(another)
    if a = friendships.find_by(friend: another)
      a.destroy
    end  
  end
  
  
end
