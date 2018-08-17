# frozen_string_literal: true

require 'rails_helper'
require 'factories/post'
require 'factories/user'

RSpec.describe Blog::PostsController, type: :controller do
  describe 'Unsigned users' do
    describe '#list' do
      it 'list page' do
        user = build_stubbed(:user)
        create(:post, user: user)
        get :list, format: :json
        expect(assigns(:blog_posts)).not_to be_empty
      end

      it 'empty list page' do
        get :list, format: :json
        expect(assigns(:blog_posts)).to be_empty
      end
    end
    describe '#list with existent tag' do
      it 'list page' do
        tags = FFaker::Lorem.words(3)
        user = build_stubbed(:user)
        post = create(:post, user: user)
        post.all_tags=tags.join(',')
        get :list, params: {tag: tags.first}, format: :json
        expect(assigns(:blog_posts)).not_to be_empty
      end

      it 'empty list page' do
        expect {get :list, params: {tag: FFaker::Lorem.word}, format: :json}.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
