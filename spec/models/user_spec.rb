require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードが入力されている場合、登録できること" do
    user = User.new(
    name: "太郎",
    email: "test@example.com",
    password: "password",
    )
    expect(user).to be_valid
  end
end
