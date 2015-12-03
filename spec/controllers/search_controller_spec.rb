require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  it 'search content without typing anything' do
    posts = create_list(:post, 10)
    post :search_results

    expect(response).to have_http_status(:success)
    #TODO: expect to display all posts which have been created above
  end

end