FactoryBot.define do
  factory :user do 
    name {'John'}
    email {'John@example.com'}
    password {'secret'}
    phone {'123-3213321'}
    avatar {Rack::Test::UploadedFile.new(Rails.root.join("spec/support/test-avatar.png"))}
  end
end 