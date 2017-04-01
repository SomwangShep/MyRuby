require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    
    def setup
        @recipe = Recipe.new(name: "chicken parm", summary: "This is the best chicken recipe ever", description: "heat oil, add oions ,a dd tomato sauce, cook for 20 minutes")
    end
    
    test "recipe should be valid"  do
        assert @recipe.valid?
    end
    
    test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test "name length should not be too long" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid? 
    end

   test "name length should not be too short" do
        @recipe.name = "a" * 4
        assert_not @recipe.valid? 
    end 
    
   test "summary should be present" do
        @recipe.summary = " " 
        assert_not @recipe.valid? 
    end
    test "summary should be too long" do
        @recipe.summary = "a"  * 151
        assert_not @recipe.valid? 
    end
    
    test "summary should be too short" do
        @recipe.summary = "a" * 9
        assert_not @recipe.valid? 
    end
    
  test "description should be present" do
        @recipe.description = " " 
        assert_not @recipe.valid? 
    end    
    
  test "description should be too long" do
        @recipe.description = "a" * 501
        assert_not @recipe.valid? 
    end
    
     test "description should be too short" do
        @recipe.description = "a" * 19
        assert_not @recipe.valid? 
    end
end