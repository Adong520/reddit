require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Example user", email: "use@example.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should not be null" do
  	@user.name = " "
  	assert_not @user.valid?
  end

  test "name should be more than 6 chars" do
  	@user.name = 'a'*5
  	assert_not @user.valid?
  end

  test "name should be less than 20 chars" do
  	@user.name = 'a'*21
  	assert_not @user.valid?
  end

  test "name should be unique" do
  	dup_user = @user.dup
  	dup_user.name = @user.name.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

  test "name should be saved to lowercase" do
  	mix_name = "AnotherUserName"
  	@user.name = mix_name
  	@user.save
  	assert_equal mix_name.downcase, @user.reload.name
  end	

  test "email shoult present" do
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "email should be more than 6 chars" do
  	@user.email = "a@a.c"
  	assert_not @user.valid?
  end 

  test "email should be less than 30 chars" do
  	@user.email = 'a' * 19 + '@example.com'
  	assert_not @user.valid?
  end

  test "email should be unique" do
  	dup_user = @user.dup
  	dup_user.email = @user.email
  	@user.save
  	assert_not dup_user.valid?
  end

  test "email shold be saved to lowercase" do
  	mix_email = 'Xyz@ExamPle.COm'
  	@user.email = mix_email
  	@user.save
  	assert_equal mix_email.downcase, @user.reload.email
  end

  test "email address validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com user_example.com user@exam_ple.com user@ex+ample.com user@example..com]
  	invalid_addresses.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} is invalid"
  	end
  end

end
