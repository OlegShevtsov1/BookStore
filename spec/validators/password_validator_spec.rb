require 'rails_helper'

RSpec.describe PasswordValidator do
  let(:validator) { described_class.new }
  let(:user) { User.new(password: 'As12345678') }

  describe '#validate' do
    it 'returns Array' do
      expect(validator.validate(user).class).to eq(Array)
    end

    context 'when password is valid' do
      it 'does not change record password errors array' do
        expect { validator.validate(user) }.not_to change(user.errors[:password], :size)
      end
    end

    context 'when password is invalid' do
      context 'when wrong password format' do
        let(:user) { User.new(password: '12345678') }

        it 'changes record errors size by 1' do
          expect { validator.validate(user) }.to change(user.errors[:password], :size).from(0).to(1)
        end

        it "add #{I18n.t('devise.password_validate')} to record password errors" do
          validator.validate(user)
          expect(user.errors[:password]).to include(I18n.t('devise.password_validate'))
        end
      end
    end
  end
end
