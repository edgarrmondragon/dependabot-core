# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/requirement"
require "dependabot/utils"

module Dependabot
  module Uv
    # UV extends Python's requirement scheme for PEP 508 requirement parsing.
    # Currently inherits all behavior from Python::Requirement.
    class Requirement < Dependabot::Python::Requirement
    end
  end
end

Dependabot::Utils
  .register_requirement_class("uv", Dependabot::Uv::Requirement)
