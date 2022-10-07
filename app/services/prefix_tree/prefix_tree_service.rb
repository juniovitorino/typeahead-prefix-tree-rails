# frozen_string_literal: true

require 'tree'

module Services
  module PrefixTree
    # Class Prefix Tree Service Object
    class PrefixTreeService
      CHUNK_MAX_SIZE = 1024

      def initialize(file_path)
        @file_chunks = StringIO.new
        @file = file_path
        @tree = Tree.new
      end

      def call
        File.open(@file).each(nil, CHUNK_MAX_SIZE) do |chunk|
          @file_chunks << chunk
        end
        parse_json
      rescue Errno::ENOENT => e
        puts "Error: #{e}"
      end

      private

      def parse_json
        data = JSON.parse(@file_chunks.string)
        data.each do |key, _value|
          @tree.insert(key)
        end
        @tree
      end
    end
  end
end
