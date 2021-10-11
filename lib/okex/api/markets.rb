# frozen_string_literal: true

require_relative 'public'

class OKEX::API::Markets < OKEX::API::Public

  def list(type: :spot)
    raise ArgumentError, "type must be either 'futures' or 'spot'" unless %w(futures spot).include?(type.to_s)
    send_request(:get, "/#{type.to_s}/v3/instruments", {})
  end

  def tickers(type: :spot)
    raise ArgumentError, "type must be either 'futures' or 'spot'" unless %w(futures spot).include?(type.to_s)
    send_request(:get, "/#{type.to_s}/v3/instruments/ticker", {})
  end

  def ticker(futures_name, type: :spot)
    raise ArgumentError, "type must be either 'futures' or 'spot'" unless %w(futures spot).include?(type.to_s)
    send_request(:get, "/#{type.to_s}/v3/instruments/#{futures_name}/ticker", {})
  end
  
end
