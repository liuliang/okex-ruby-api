require 'test_helper'

class MarketsTest < Minitest::Test
  def setup
    @markets = OKEX::API::Markets.new
  end

  # Get a list of all futures
  def test_list_futures
    response = @markets.stub(:print_log, nil) do
      @markets.list(type: :futures)
    end

    assert_instance_of Array, response

    btc_market = response.find { |f| f[:instrument_id].include?("BTC-USD") && f[:is_inverse]=="false" && f[:alias]=="quarter" }
    expected_data = {
      :underlying_index         => 'BTC',
      :quote_currency           => 'USDT',
      :tick_size                => '0.1',
      :contract_val             => '0.01',
      :trade_increment          => '1',
      :alias                    => 'quarter',
      :underlying               => 'BTC-USDT',
      :base_currency            => 'BTC',
      :settlement_currency      => 'USDT',
      :is_inverse               => 'false',
      :contract_val_currency    => 'BTC',
    }
    assert_hash_to_include expected_data, btc_market
  end

  # Get a list of all spot currencies
  def test_list_spot
    response = @markets.stub(:print_log, nil) do
      @markets.list(type: :spot)
    end

    assert_instance_of Array, response

    btc_market = response.find { |f| f[:base_currency]=="BTC" }
    expected_data = {
      :base_currency    =>"BTC", 
      :category         =>"1", 
      :instrument_id    =>"BTC-USDT", 
      :min_size         =>"0.00001", 
      :quote_currency   =>"USDT", 
      :size_increment   =>"0.00000001", 
      :tick_size        =>"0.1"
    }
    
    assert_hash_to_include expected_data, btc_market
  end

  # Get list of all futures ticker prices
  def test_futures_tickers
    btc_contract = @markets.list(type: :futures).find { |f| f[:instrument_id].include?("BTC-USD") && f[:is_inverse]=="false" && f[:alias]=="quarter" }

    response = @markets.stub(:print_log, nil) do
      @markets.tickers(type: :futures)
    end

    assert_instance_of Array, response

    btc_market = response.find { |f| f[:instrument_id]==btc_contract.dig(:instrument_id) }
    expected_data = {
      :instrument_id => btc_contract.dig(:instrument_id),
    }

    assert_hash_has_keys btc_market, [:instrument_id, :last, :best_bid, :best_ask, :high_24h, :low_24h, :volume_24h, :timestamp, :last_qty, :best_ask_size, :best_bid_size, :volume_token_24h, :open_utc0, :open_utc8]
    assert_hash_to_include expected_data, btc_market
  end

  # Get list of all spot ticker prices
  def test_spot_tickers
    response = @markets.stub(:print_log, nil) do
      @markets.tickers(type: :spot)
    end

    assert_instance_of Array, response

    btc_market = response.find { |f| f[:instrument_id]=='LTC-BTC' }
    expected_data = {
      :instrument_id => 'LTC-BTC',
    }

    assert_hash_has_keys btc_market, [:best_ask, :best_bid, :instrument_id, :open_utc0, :open_utc8, :product_id, :last, :last_qty, :ask, :best_ask_size, :bid, :best_bid_size, :open_24h, :high_24h, :low_24h, :base_volume_24h, :timestamp, :quote_volume_24h]
    assert_hash_to_include expected_data, btc_market
  end

  # Get ticker price for single futures contract
  def test_futures_ticker
    btc_contract = @markets.list.find { |f| f[:instrument_id].include?("BTC-USD") && f[:is_inverse]=="false" && f[:alias]=="quarter" }

    response = @markets.stub(:print_log, nil) do
      @markets.ticker(btc_contract.dig(:instrument_id), type: :futures)
    end

    assert_instance_of Hash, response

    expected_data = {
      :instrument_id => btc_contract.dig(:instrument_id),
    }

    assert_hash_has_keys response, [:instrument_id, :last, :best_bid, :best_ask, :high_24h, :low_24h, :volume_24h, :timestamp, :last_qty, :best_ask_size, :best_bid_size, :volume_token_24h, :open_utc0, :open_utc8]
    assert_hash_to_include expected_data, response
  end

  # Get ticker price for single spot currency
  def test_spot_ticker
    response = @markets.stub(:print_log, nil) do
      @markets.ticker('LTC-BTC', type: :spot)
    end

    assert_instance_of Hash, response

    expected_data = {
      :instrument_id => 'LTC-BTC',
    }

    assert_hash_has_keys response, [:best_ask, :best_bid, :instrument_id, :open_utc0, :open_utc8, :product_id, :last, :last_qty, :ask, :best_ask_size, :bid, :best_bid_size, :open_24h, :high_24h, :low_24h, :base_volume_24h, :timestamp, :quote_volume_24h]
    assert_hash_to_include expected_data, response
  end
end
