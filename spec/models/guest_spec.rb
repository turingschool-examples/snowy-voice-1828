require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :rooms_guests }
    it { should have_many(:rooms).through(:rooms_guests) }
  end
end