# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/file_updater/requirement_replacer"
require "dependabot/uv/file_updater"

module Dependabot
  module Uv
    class FileUpdater
      # UV extends Python's requirement replacer for PEP 508 requirement updating.
      # Currently inherits all behavior from Python::FileUpdater::RequirementReplacer.
      class RequirementReplacer < Dependabot::Python::FileUpdater::RequirementReplacer
      end
    end
  end
end
