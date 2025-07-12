# lib/inject.rb

module Rubocop
  module Helper_Lint
    module Inject
      def self.defaults!
        path = File.expand_path("../../../config/default.yml", __FILE__)
        ::RuboCop::ConfigLoader.default_configuration = ::RuboCop::ConfigLoader.load_file(path)
      end
    end
  end
end
