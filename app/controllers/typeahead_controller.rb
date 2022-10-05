# frozen_string_literal: true

# Typeahead Controller
class TypeaheadController < ApplicationController
  def filter_by_prefix
    puts @@tree
    render json: %w[hello: `World`]
  end
end
