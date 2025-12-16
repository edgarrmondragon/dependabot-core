# typed: strong
# frozen_string_literal: true

require "dependabot/uv/update_checker"
require "dependabot/python/update_checker/pip_version_resolver"

module Dependabot
  module Uv
    class UpdateChecker
      # UV uses the same pip version resolution logic as Python.
      # Delegates to Python's PipVersionResolver implementation.
      PipVersionResolver = Dependabot::Python::UpdateChecker::PipVersionResolver
    end
  end
end
