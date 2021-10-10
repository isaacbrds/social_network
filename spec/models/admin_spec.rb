require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "admin is valid" do 
    admin = Admin.new(name: 'admin', email: "admin@example.com", password: "password" )

    expect(admin.email).to eq("admin@example.com")
    expect(admin).to be_valid
  end

  it "admin is invalid" do 

    admin = Admin.new(email: "admin@example.com" )

    expect(admin).to_not be_valid
  end
end
