require 'rails_helper'

RSpec.describe Company, :type => :model do
  context "When it's created" do
    it "Should be valid" do
      expect(subject).not_to be_valid
    end
  end
end
