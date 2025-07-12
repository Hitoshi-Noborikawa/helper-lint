module RuboCop
  module Cop
    module Lint
      class PrivateHelperMethod < ::RuboCop::Cop::Base
        MSG = 'helperファイル内で`private`は無視されるため定義しないでください。'

        def on_send(node)
          return unless in_helper_file?
          return unless node.method_name == :private

          add_offense(node.loc.selector)
        end

        private

        def in_helper_file?
          processed_source.file_path.include?('/app/helpers/')
        end
      end
    end
  end
end
