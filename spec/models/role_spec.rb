require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Role, type: :model do
  describe 'User' do
    describe 'abilities' do
      subject(:ability) { Ability.new(user) }
      let(:user) { nil }

      context 'when is an anonymous' do
        it { should not_have_abilities(:access, :rails_admin) }
      end

      context 'when is an admin' do
        let(:user) { FactoryGirl.create(:admin) }
        it { should be_able_to(:manage, :rails_admin) }
      end
    end
  end
end
