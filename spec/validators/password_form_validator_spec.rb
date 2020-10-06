require 'rails_helper'

RSpec.describe PasswordFormValidator do
  let(:password_form_validator) { described_class.new }

  describe '#validate' do
    let(:password) { 'As12345678' }
    let(:user) { create(:user, password: password) }

    context 'with valid data' do
      let(:params) { { old_password: password, password: 'As876543', confirm_password: 'As876543', user_id: user.id } }
      let(:password_form) { PasswordForm.new(params) }

      it "doesn't change record errors" do
        expect { password_form_validator.validate(password_form) }.not_to change(password_form, :errors)
      end
    end

    context 'with invalid data' do
      context 'when old password does not match' do
        let(:params) { { old_password: '12345', password: 'As876543', confirm_password: 'As876543', user_id: user.id } }
        let(:password_form) { PasswordForm.new(params) }

        it 'changes record old password errors by 1' do
          expect { password_form_validator.validate(password_form) }
            .to change(password_form.errors[:old_password], :size).from(0).to(1)
        end
      end

      context 'when confirm password does not match to password' do
        let(:params) { { old_password: password, password: 'As876543', confirm_password: '876543', user_id: user.id } }
        let(:password_form) { PasswordForm.new(params) }

        it 'changes record confirm password error by 1' do
          expect { password_form_validator.validate(password_form) }
            .to change(password_form.errors[:confirm_password], :size).from(0).to(1)
        end
      end
    end
  end
end
