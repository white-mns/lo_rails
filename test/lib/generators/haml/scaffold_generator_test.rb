require 'test_helper'
require 'generators/haml/scaffold/scaffold_generator'

class Haml::ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Haml::ScaffoldGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
