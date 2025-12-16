# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/file_updater/requirement_file_updater"
require "dependabot/uv/file_updater"

module Dependabot
  module Uv
    class FileUpdater
      # UV extends Python's requirement file updater for requirements.txt updating.
      # Currently inherits all behavior from Python::FileUpdater::RequirementFileUpdater.
      class RequirementFileUpdater < Dependabot::Python::FileUpdater::RequirementFileUpdater
      end
    end
  end
end
