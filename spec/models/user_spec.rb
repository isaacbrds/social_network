require 'rails_helper'

RSpec.describe User, type: :model do
  it "user is valid" do 
   user = User.new(
     name: "john", 
     email: "john@example.com", 
     phone: "123-321312", 
     password:"secret", 
     password_confirmation: "secret",
     avatar: Rack::Test::UploadedFile.new(Rails.root.join("spec/support/test-avatar.png"))
    )

    expect(user).to be_valid

  end

  it "user is invalid" do 

    user = User.new(
      name: "john", 
      email: "john@example.com", 
      phone: "123-321312", 
      
     )
 
     expect(user).to_not be_valid
  end
end
