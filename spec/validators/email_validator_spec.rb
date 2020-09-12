require 'rails_helper'

RSpec.describe EmailValidator do
  let(:email) { 'user1@gmail.com' }
  let(:record) { User.new(email: email) }
  let(:validator) { described_class.new }

  describe '#validate' do
    describe 'variables' do
      before { validator.validate(record) }

      it 'sets email instance variable' do
        expect(validator.instance_variables).to include(:@email)
      end

      it 'sets email value to email' do
        expect(validator.instance_variable_get(:@email)).to eq(email)
      end
    end

    context 'when record errors have not nil values' do
      it 'returns empty Array when record has no errors' do
        expect(validator.validate(record).empty?).to be(true)
      end
    end

    context 'when record errors have nil values' do
      before { record.errors[:email] << nil }

      it 'returns Array' do
        expect(validator.validate(record).class).to eq(Array)
      end
    end

    describe '#validate_domain' do
      before { validator.validate(record) }

      it 'returns Array' do
        expect(validator.validate_domain(record).class).to eq(Array)
      end

      context 'when domain part is valid' do
        it 'returns array of nil' do
          validator.validate_domain(record)
          expect(record.errors[:email]).to all(be nil)
        end
      end

      context 'when domain part is invalid' do
        let(:invalid_email) { 'wrong_email' }
        let(:record) { User.new(email: invalid_email) }

        context 'with wrong format' do
          it 'add wrong format error to record email errors' do
            validator.validate_domain(record)
            expect(record.errors[:email])
              .to include(I18n.t('devise.wrong_format', format_example: described_class::CORRECT_FORMAT_EXAMPLE))
          end
        end
      end
    end

    describe '#validate_local' do
      before { validator.validate(record) }

      it 'returns Array' do
        expect(validator.validate_local(record).class).to eq(Array)
      end

      context 'when local part is valid' do
        it 'returns array of nil' do
          validator.validate_local(record)
          expect(record.errors[:email]).to all(be nil)
        end
      end

      context 'when local is invalid' do
        let(:invalid_email) { "#{'wrong_email7' * 10}@gmail.com" }
        let(:record) { User.new(email: invalid_email) }

        context 'when too long' do
          it 'add local part size error to record email errors' do
            validator.validate_local(record)
            expect(record.errors[:email])
              .to include(I18n.t('devise.email_size_error',
                                 max_size: described_class::LOCAL_MAX_SIZE))
          end
        end

        context 'when includes wrong symbols ' do
          context "with #{described_class::WRONG_SYMBOLS[:dots]}" do
            let(:invalid_email) { 'user..1@gmail.com' }
            let(:record) { User.new(email: invalid_email) }

            it 'add message about wrong symbols to record email errors' do
              validator.validate_local(record)
              expect(record.errors[:email])
                .to include(I18n.t('devise.email_validate', symbols: described_class::WRONG_SYMBOLS[:dots]))
            end
          end

          context "with #{described_class::WRONG_SYMBOLS[:hyphens]}" do
            let(:invalid_email) { 'user--1@gmail.com' }
            let(:record) { User.new(email: invalid_email) }

            it 'add message about wrong symbols to record email errors' do
              validator.validate_local(record)
              expect(record.errors[:email])
                .to include(I18n.t('devise.email_validate', symbols: described_class::WRONG_SYMBOLS[:hyphens]))
            end
          end

          context 'when end or start with wrong symbols' do
            context "with #{described_class::WRONG_SIDES_SYMBOLS.first}" do
              let(:invalid_email) { '.user1.@gmail.com' }
              let(:record) { User.new(email: invalid_email) }

              it 'add local part sides error to record mail errors' do
                validator.validate_local(record)
                expect(record.errors[:email])
                  .to include(I18n.t('devise.email_sides_error',
                                     wrong_symbols: described_class::WRONG_SIDES_SYMBOLS.join))
              end
            end

            context "with #{described_class::WRONG_SIDES_SYMBOLS.last}" do
              let(:invalid_email) { '-user1-@gmail.com' }
              let(:record) { User.new(email: invalid_email) }

              it 'add local part sides error to record mail errors' do
                validator.validate_local(record)
                expect(record.errors[:email])
                  .to include(I18n.t('devise.email_sides_error',
                                     wrong_symbols: described_class::WRONG_SIDES_SYMBOLS.join))
              end
            end
          end
        end
      end
    end
  end
end
