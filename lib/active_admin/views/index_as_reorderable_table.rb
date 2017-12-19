module ActiveAdmin
  module Views
    class IndexAsReorderableTable < IndexAsTable

      def self.index_name
        'reorderable_table'
      end

      def build(page_presenter, collection)
        add_class 'aa-reorderable'

        table_options = {
          "id" => "index_table_#{active_admin_config.resource_name.plural}",
          "sortable" => true,
          "i18n" => active_admin_config.resource_class,
          "paginator" => page_presenter[:paginator] != false,
          "row_class" => page_presenter[:row_class],
          "ng-app" => page_presenter["ng-app"],
          "ng-controller" => page_presenter["ng-controller"],
        }

        table_for collection, table_options do |t|
          table_config_block = page_presenter.block || default_table
          instance_exec(t, &table_config_block)
        end
      end

      def table_for(*args, &block)
        insert_tag ReorderableTableFor, *args, &block
      end

    end
  end
end
