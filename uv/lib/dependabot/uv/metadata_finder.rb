# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/metadata_finder"
require "dependabot/metadata_finders"

module Dependabot
  module Uv
    # UV extends Python's metadata finder for PyPI package metadata lookup.
    # Currently inherits all behavior from Python::MetadataFinder.
    class MetadataFinder < Dependabot::Python::MetadataFinder
    end
  end
end

Dependabot::MetadataFinders
  .register("uv", Dependabot::Uv::MetadataFinder)
