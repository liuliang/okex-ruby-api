require 'test_helper'

class FuturesTest < Minitest::Test
  def setup
    @futures = OKEX::API::Futures.new
  end

  def test_list
    response = @futures.stub(:print_log, nil) do
      @futures.list
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

  def test_tickers
    btc_contract = @futures.list.find { |f| f[:instrument_id].include?("BTC-USD") && f[:is_inverse]=="false" && f[:alias]=="quarter" }

    response = @futures.stub(:print_log, nil) do
      @futures.tickers
    end

    assert_instance_of Array, response

    btc_market = response.find { |f| f[:instrument_id]==btc_contract.dig(:instrument_id) }
    expected_data = {
      :instrument_id => btc_contract.dig(:instrument_id),
    }

    assert_hash_has_keys btc_market, [:instrument_id, :last, :best_bid, :best_ask, :high_24h, :low_24h, :volume_24h, :timestamp, :last_qty, :best_ask_size, :best_bid_size, :volume_token_24h, :open_utc0, :open_utc8]
    assert_hash_to_include expected_data, btc_market
  end

  def test_ticker
    btc_contract = @futures.list.find { |f| f[:instrument_id].include?("BTC-USD") && f[:is_inverse]=="false" && f[:alias]=="quarter" }

    response = @futures.stub(:print_log, nil) do
      @futures.ticker(btc_contract.dig(:instrument_id))
    end

    assert_instance_of Hash, response

    expected_data = {
      :instrument_id => btc_contract.dig(:instrument_id),
    }

    assert_hash_has_keys response, [:instrument_id, :last, :best_bid, :best_ask, :high_24h, :low_24h, :volume_24h, :timestamp, :last_qty, :best_ask_size, :best_bid_size, :volume_token_24h, :open_utc0, :open_utc8]
    assert_hash_to_include expected_data, response
  end
end
