class SetPrecisionAndScaleForCurrencyValueValue < ActiveRecord::Migration
  def self.up
    change_column :currency_values, :value, :decimal, :precision => 20, :scale => 10
  end

  def self.down
    change_column :currency_values, :value, :decimal
  end
end
