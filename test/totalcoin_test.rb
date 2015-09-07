require 'test/unit'
require 'totalcoin'

class TotalCoinTest < Test::Unit::TestCase

  def setup
    @api = TotalCoin::Api.new("CLIENT_EMAIL", "API_KEY")
  end

  def test_get_access_token
    token_id = @api.get_access_token
    assert_not_nil(token_id)
  end

  def test_perform_checkout
    data = {
      "Amount" => 200,
      "Quantity" => 1,
      "Country" => "ARG",
      "Currency" => "ARS",
      "Description" => "Zapatillas",
      "PaymentMethods" => "CREDITCARD|CASH|TOTALCOIN",
      "Reference" => "0129618531",
      "Site" => "Ruby SDK",
      "MerchantId" => "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
    }

    response = @api.perform_checkout(data)
    assert_not_nil(response)
    assert(response[:IsOk])
    assert_not_nil(response[:Response])
    assert_match(/https?:\/\/[\S]+/, response[:Response][:URL])
  end

  def test_get_ipn_info
    response = @api.get_ipn_info("xxxxx")
    assert_not_nil(response)
    assert(response[:IsOk])
    assert_not_nil(response[:Response])
  end

  def test_get_merchants
    response = @api.get_merchants
    assert_not_nil(response)
    assert(response[:IsOk])
    assert_not_nil(response[:Response])
  end
end
