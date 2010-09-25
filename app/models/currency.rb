class Currency < ActiveRecord::Base
  has_many :currency_values

  validates_presence_of :name

  def name=(name)
    raise ArgumentError, 'The "name" must be a String.' unless name.is_a? String
    write_attribute :name, name.upcase
  end

  def to_param
    name.downcase
  end
end
