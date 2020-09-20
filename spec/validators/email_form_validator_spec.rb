require 'rails_helper'

RSpec.describe EmailFormValidator do
  let(:email_form_validator) { described_class.new }

  describe '#validate' do
    let(:user) { create(:user) }

    context 'when email is uniq' do
      it 'does not change record email errors' do
        expect { email_form_validator.validate(user) }.not_to change(user, :errors)
      end
    end

    context 'when email is already used' do
      let(:invalid_user) { User.new(email: user.email) }

      it 'changes record email errors by 1' do
        expect { email_form_validator.validate(invalid_user) }
          .to change(invalid_user.errors[:email], :size).from(0).to(1)
      end
    end
  end
end
