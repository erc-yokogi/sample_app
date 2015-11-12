require 'spec_helper'

describe Micropost do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { FactoryGirl.create(:user) }
  #before do
    # ���̃R�[�h�͊��p�I�ȈӖ��Ő������Ȃ��B
    #@micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
    before { @micropost = user.microposts.build(content: "Lorem ipsum") }
  #end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end

end