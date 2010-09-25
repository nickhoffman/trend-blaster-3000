class CurrencyValue < ActiveRecord::Base
  belongs_to :currency

  validates_presence_of :currency
end
