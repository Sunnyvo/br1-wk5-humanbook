require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
    #   assert true
    # end
    test "#add_friend should add a stranger user as a friend" do
      a = User.create(name: "Ian", email: "Ian@yahoo.com", password: "123")
      b = User.create(name: "Tan", email: "Tan@yahoo.com", password: "123")  
      a.add_friend(b)
      assert_includes a.friends, b  
      assert_equal 1, a.friends.count 
    end
    
    test "#add_friend should not add a stranger as a friend twice" do
      a = User.create(name: "Ian", email: "Ian@yahoo.com", password: "123")
      b = User.create(name: "Tan", email: "Tan@yahoo.com", password: "123")  
      a.add_friend(b)
      a.add_friend(b) 
      a.add_friend(b) 
      # assert_equal 4, a.friends.count    
      assert_equal 1, a.friends.count 
    end   
    test "#is_friends? should return true if they are friends" do
      a = User.create(name: "Ian", email: "Ian@yahoo.com", password: "123")
      b = User.create(name: "Tan", email: "Tan@yahoo.com", password: "123")  
      assert_equal false, a.is_friend?(b)
      a.add_friend(b)   
      assert_equal true, a.is_friend?(b)   
    end

    test "#remove_friend should remove its friendship" do
      a = User.create(name: "Ian", email: "Ian@yahoo.com", password: "123")
      b = User.create(name: "Tan", email: "Tan@yahoo.com", password: "123")  
      a.add_friend(b)  
      assert_equal 1, a.friends.count   
      a.remove_friend(b)   
      # assert_equal 1, a.friends.count  
      assert_equal 0, a.friends.count  
    end  
  end
  