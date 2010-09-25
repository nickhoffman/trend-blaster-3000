class CreateCurrencyValues < ActiveRecord::Migration
  def self.up
    create_table :currency_values do |t|
      t.decimal :value
      t.datetime :date_bid
      t.references :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :currency_values
  end
end
