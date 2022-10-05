require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get index paginate results" do
    Client.delete_all
    50.times { |i| Client.create name: (i + 1).to_s.rjust(2, '0') }
    get clients_url
    assert_select 'tbody tr', count: 30
    assert_select 'tbody tr:first td:first', text: '01'
    assert_select 'tbody tr:last  td:first', text: '30'

    get clients_url(page: 2)
    assert_select 'tbody tr', count: 20
    assert_select 'tbody tr:first td:first', text: '31'
    assert_select 'tbody tr:last  td:first', text: '50'
  end

  test "should get index show pagination" do
    Client.delete_all
    50.times { |i| Client.create name: (i + 1).to_s.rjust(2, '0') }
    get clients_url
    assert_select 'tbody tr', count: 30
    assert_select 'tbody tr:first td:first', text: '01'
    assert_select 'tbody tr:last  td:first', text: '30'
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { name: @client.name } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should create display a translated flash messages" do
    post clients_url, params: { client: { name: @client.name } }
    follow_redirect!
    assert_select '.alert', text: /Registro criado com sucesso/
  end

  test "should create client with errors display list of error messages" do
    post clients_url, params: { client: { name: '' } }
    assert_select '#error_explanation'
    assert_select 'li', text: 'Nome não pode ficar em branco'
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { name: @client.name } }
    assert_redirected_to client_url(@client)
  end

  test "should update display a translated flash messages" do
    patch client_url(@client), params: { client: { name: @client.name.reverse } }
    follow_redirect!
    assert_select '.alert', text: /Registro atualizado com sucesso/
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end

  test "should destroy display a translated flash messages" do
    delete client_url(@client)
    follow_redirect!
    assert_select '.alert', text: /Registro removido com sucesso/
  end
end
