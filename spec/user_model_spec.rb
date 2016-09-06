describe "User model" do
  it "#say_name user says his/her name" do
    jim = User.new(name: "Jim", email: "jim@mail.com")
    expect(jim.say_name).to eq("my name is Jim")
  end
end