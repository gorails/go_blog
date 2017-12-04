# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Unsigned users' do
    it 'empty list page' do
      expect(assigns(:blog_posts)).to must_be_empty
      adsfadsfadsf
    end
  end
end
