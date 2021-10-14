# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'validates presence of attributes' do
      user = create(:user)
      expect(user).to be_valid
      user = build(:user, login: nil, provider: nil)
      expect(user).to be_invalid
    end

    it 'login should be unique' do
      user = create(:user)
      expect(user).to be_valid

      user2 = build(:user, login: user.login)
      expect(user2).to be_invalid
    end
  end
end
