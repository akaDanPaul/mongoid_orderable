module Mongoid
  module Orderable
    module Generator
      include Mongoid::Orderable::Generator::Scope
      include Mongoid::Orderable::Generator::Position
      include Mongoid::Orderable::Generator::Movable
      include Mongoid::Orderable::Generator::Listable
      include Mongoid::Orderable::Generator::Helpers

      def column_name
        configuration[:field_opts][:as] || configuration[:column]
      end

      def order_scope
        configuration[:scope]
      end

      def generate_all_helpers
        generate_scope_helpers(column_name, order_scope)
        generate_position_helpers(column_name)
        generate_movable_helpers(column_name)
        generate_listable_helpers(column_name)
        generate_orderable_helpers
      end

      protected

      def generate_method(name, &block)
        klass.send(:define_method, name, &block)
      end

    end
  end
end