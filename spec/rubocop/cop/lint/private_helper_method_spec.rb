require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../lib/rubocop/cop/lint/private_helper_method'

RSpec.describe RuboCop::Cop::Lint::PrivateHelperMethod, :config do
  include RuboCop::RSpec::ExpectOffense

  let(:config) { RuboCop::Config.new }

  context 'helperファイルにprivateメソッドがある場合' do
    let(:source_path) { 'app/helpers/foo_helper.rb' }

    it 'registers an offense for use of private' do
      expect_offense(<<~RUBY, source_path)
        module FooHelper
          private
          ^^^^^^^ helperファイル内で`private`は無視されるため定義しないでください。
          def greet
            'Hello'
          end
        end
      RUBY
    end
  end

  context 'modelファイルにprivateメソッドがある場合' do
    let(:source_path) { 'app/models/foo.rb' }

    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY, source_path)
        class Foo
          private

          def bar
            'bar'
          end
        end
      RUBY
    end
  end
end

puts "LOADED: #{RuboCop::Cop::Lint::PrivateHelperMethod.inspect}"
