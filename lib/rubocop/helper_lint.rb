# lib/helper_lint.rb

require "rubocop"
require_relative "helper_lint/version"
require_relative "rubocop/helper_lint/inject"

RuboCop::HelperLint::Inject.defaults!
