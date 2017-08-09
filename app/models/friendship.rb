class Friendship < ApplicationRecord
  belongs_to :user # same convention user -> rails can find if no class defined
  belongs_to :friend, class_name: "User" # virtual friend variable take a user variable
  # If want no self frienship -> Add validate user_id # friend_id
end
