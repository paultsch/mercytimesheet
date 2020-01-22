class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :timesheets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # def stock_already_added?(ticker_symbol)
         #   stock = Stock.find_by_ticker(ticker_symbol)
         #   return false unless stock
         #   user_stocks.where(stock_id: stock.id).exists?
         # end

    def fullname
      "#{first_name} #{last_name}"
    end

end
