class Stock < ApplicationRecord

  def self.new_lookup(ticker_sym)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker_sym, name:client.company(ticker_sym).company_name, last_price: client.price(ticker_sym))
    rescue => exception
      return nil
    end
  end
end
