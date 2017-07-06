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

  test "should accept many phones" do
    c = Client.new name: 'Jonh'
    c.save
    c.phones.create number: '(86) 9988-7766'
    c.phones.create number: '(86) 9988-7744'

    assert c.phones.count == 2
  end

  test "should accept many emails" do
    c = Client.new name: 'Jonh'
    c.save
    c.emails.create address: 'jonh@gmail.com'
    c.emails.create address: 'jonh@yahoo.com'

    assert c.emails.count == 2
  end
end
