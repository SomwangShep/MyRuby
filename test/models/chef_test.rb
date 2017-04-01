require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.new(chefname: "John", email: "john@example.com")
    end
    
    test "cheft should be valid" do
        assert @chef.valid?
    end
    test "cheft should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end    
    test "cheftname should not too long" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end     
    test "cheftname should be too short" do
        @chef.chefname = "aa"
        assert_not @chef.valid?
    end  
    test "cheftname email sgold be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end    
    test "cheftname email with in bounds" do
        @chef.email = "a" * 101 + "@example.com"
        assert_not @chef.valid?
    end    
    
    test "email need unique" do
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.uppercase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "eamil validation should accept email" do
        valid_addrress = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.com]
        valid_addrress.each do |va|
            @chef.email = va
            assert @chef.valid?, '#{va.inspect} should be valid'
    end
    
   test "eamil validation should reject email" do
       invalid_address = %w[user@example.com user_at_eee.org user.name@example]
       invalid_address.each do |ia|
           @chef.email = ia
           assert_not @chef.valid?, '#{ia.inspect} should be invalid}'
    end    
    
end