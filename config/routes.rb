# frozen_string_literal: true

Rails.application.routes.draw do
  get '/typeahead/:prefix', to: 'typeahead#filter_by_prefix'
end
