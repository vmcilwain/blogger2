require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:title).of_type(:string)
                                 .with_options(null: false, default: '')
    should have_db_column(:created_by).of_type(:integer)
    should have_db_column(:updated_by).of_type(:integer)
  end

  context 'validations' do
    should validate_presence_of :title
  end

  should belong_to(:creator).optional
  should belong_to(:updater).optional
end
