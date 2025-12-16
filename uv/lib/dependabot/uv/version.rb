# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/version"
require "dependabot/utils"

module Dependabot
  module Uv
    # UV extends Python's version scheme for PEP 440 version handling.
    # Currently inherits all behavior from Python::Version.
    class Version < Dependabot::Python::Version
    end
  end
end

Dependabot::Utils
  .register_version_class("uv", Dependabot::Uv::Version)
