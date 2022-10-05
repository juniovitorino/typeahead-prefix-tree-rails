# frozen_string_literal: true

# Tree Node
class TreeNode
  attr_accessor :leaves,
                :key,
                :is_word_end

  attr_reader :name
  attr_writer :times

  def initialize
    @leaves = {}
    @key = ''
    @is_word_end = false
  end
end

# Tree
class Tree
  attr_reader :root

  def initialize
    @root = TreeNode.new
  end

  def insert(word)
    current = @root
    word.split('').each do |c|
      key = c.prefixify
      current.leaves[key] = TreeNode.new unless current.leaves.key?(key)
      current.key = key
      current = current.leaves[key]
    end
    current.is_word_end = true
  end

  def search(word)
    current = @root
    word.split('').each do |c|
      key = c.prefixify
      return false unless current.leaves.key?(key)

      current = current.leaves[key]
    end
    current.is_word_end
  end
end

# TreeHelper Module
class String
  def prefixify
    downcase
  end
end
