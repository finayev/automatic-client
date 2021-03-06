require File.expand_path('../webhook', __FILE__)

module Automatic
  module Core
    class Webhooks
      include Enumerable

      def initialize(collection)
        @collection = Array(collection)
      end

      def each(&block)
        record_collection.each(&block)
      end

      def find_by_name(name)
        self.select { |record| record.name == name.to_s }.first
      end

      private
      def record_collection
        @collection.map { |record| Webhook.new(record) }
      end
    end
  end
end
