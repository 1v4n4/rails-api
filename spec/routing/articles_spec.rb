require 'rails_helper'

RSpec.describe '/article routes' do
  it 'routes to articles#index' do
    # expect(get '/articles').to route_to(controller: 'articles', action: 'index')
    expect(get '/articles').to route_to('articles#index')
    # expect(get '/articles?page=3').to route_to('article#index', page: {number: 3 })
  end

  it 'routes to articles#show' do
    expect(get 'articles/1').to route_to('articles#show', id: '1')
  end

end