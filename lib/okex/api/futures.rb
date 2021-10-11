# frozen_string_literal: true

require_relative 'public'

class OKEX::API::Futures < OKEX::API::Public

  def list
    send_request(:get, '/futures/v3/instruments', {})
  end

  def tickers
    send_request(:get, '/futures/v3/instruments/ticker', {})
  end

  def ticker(futures_name)
    send_request(:get, "/futures/v3/instruments/#{futures_name}/ticker", {})
  end
  
end
