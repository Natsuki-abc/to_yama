require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードが入力されている場合、有効であること" do
    user = User.new(
    name: "太郎",
    email: "test@example.com",
    password: "password",
    )
    expect(user).to be true
  end

  it "名前がない場合、無効であること" do

  end

  it "メールアドレスがない場合、無効であること" do
  end

  it "パスワードがない場合、無効であること" do
  end
end
