require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation for a record in User model' do
    let(:user) { User.new } # an empty user model
    it 'case: Error' do
      user.name = nil

      # check the error
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'case: Validates true' do
      user.name = 'John'
      user.email = 'user@gmail.com'
      user.password = 'asdf@123'
      expect { user.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
      expect(user).to be_valid
    end
  end
end
