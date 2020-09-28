class EmailValidator < ActiveModel::Validator
  DIVIDER = '@'.freeze
  LOCAL_MAX_SIZE = 63
  WRONG_SYMBOLS = { dots: '..', hyphens: '--' }.freeze
  WRONG_SIDES_SYMBOLS = %w[. -].freeze
  DOMAIN_FORMAT = /[a-z][.][a-z]/.freeze
  CORRECT_FORMAT_EXAMPLE = 'gmail.com'.freeze

  attr_reader :email

  def validate(record)
    @email = record.email
    validate_local(record)
    validate_domain(record)
    record.errors[:email].compact!
  end

  def validate_local(record)
    record.errors[:email].push(local_length, wrong_symbols_dots, wrong_symbols_hyphens, wrong_sides_symbols)
  end

  def validate_domain(record)
    record.errors[:email].push(wrong_format)
  end

  private

  def local
    email.split(DIVIDER).first
  end

  def domain
    email.split(DIVIDER).last
  end

  def wrong_format
    I18n.t('devise.wrong_format', format_example: CORRECT_FORMAT_EXAMPLE) unless domain.match?(DOMAIN_FORMAT)
  end

  def local_length
    I18n.t('devise.email_size_error', max_size: LOCAL_MAX_SIZE) if length_invalid?
  end

  def length_invalid?
    local.size > LOCAL_MAX_SIZE
  end

  def wrong_symbols_dots
    I18n.t('devise.email_validate', symbols: WRONG_SYMBOLS[:dots]) if include_symbols?(WRONG_SYMBOLS[:dots])
  end

  def wrong_symbols_hyphens
    I18n.t('devise.email_validate', symbols: WRONG_SYMBOLS[:hyphens]) if include_symbols?(WRONG_SYMBOLS[:hyphens])
  end

  def include_symbols?(symbols)
    local.include?(symbols)
  end

  def wrong_sides_symbols
    return unless sides_error?

    I18n.t('devise.email_sides_error', wrong_symbols: WRONG_SIDES_SYMBOLS.join)
  end

  def sides_error?
    errors = []
    WRONG_SIDES_SYMBOLS.each { |symbol| errors << local.start_with?(symbol) || local.end_with?(symbol) }
    errors.compact!
    errors.any?
  end
end
