# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/requirement_parser"

module Dependabot
  module Uv
    # UV extends Python's requirement parser for PEP 508 requirement parsing.
    # Currently inherits all behavior and regex constants from Python::RequirementParser.
    class RequirementParser < Dependabot::Python::RequirementParser
    end
  end
end
