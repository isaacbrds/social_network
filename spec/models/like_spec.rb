require 'rails_helper'

RSpec.describe Like, type: :model do
  it "User like a post" do 
   matt = FactoryBot.create(:user)
   bob = FactoryBot.create(:user, email: "bob@example.com")
   andrew = FactoryBot.create(:user, email: "andrew@example")

   post = FactoryBot.create(:post, user: andrew)
   
   Like.create(user: andrew, post: post)
   expect(post.likes.count).to eq 1
   expect(post.likes.first.user).to eq andrew
   
   Like.create(user: matt, post: post)
   expect(post.likes.count).to eq 2
   expect(post.likes.last.user).to eq matt
   
  end
end
