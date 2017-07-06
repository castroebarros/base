require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "name is required" do
    c = Client.new
    c.save
    assert c.errors['name'].any?

    c.name = 'Jonh'
    c.save
    assert c.errors['name'].blank?
  end
end
