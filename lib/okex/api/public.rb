# frozen_string_literal: true

require_relative 'base'

class OKEX::API::Public < OKEX::API::Base

  protected

  def send_request(method, path, query)
    super(method, path, {}, query)
  end
  
end
