# typed: strong
# frozen_string_literal: true

require "dependabot/uv/update_checker"
require "dependabot/python/update_checker/latest_version_finder"

module Dependabot
  module Uv
    class UpdateChecker
      # UV uses the same PyPI registry and version finding logic as Python.
      # Delegates to Python's LatestVersionFinder implementation.
      LatestVersionFinder = Dependabot::Python::UpdateChecker::LatestVersionFinder
    end
  end
end
