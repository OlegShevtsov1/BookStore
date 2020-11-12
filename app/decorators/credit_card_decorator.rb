class CreditCardDecorator < Draper::Decorator
  delegate_all

  SECRET_NUMS_FOR_CARD = '** ** ** '.freeze
  COUNT_NUMS_CARD_SHOW = 4

  def hide_number
    "#{SECRET_NUMS_FOR_CARD}#{last_four_numbers_of_card}"
  end

  def last_four_numbers_of_card
    object.number[-COUNT_NUMS_CARD_SHOW..].chars.join
  end
end
