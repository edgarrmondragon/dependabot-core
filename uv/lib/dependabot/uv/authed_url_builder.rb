# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/authed_url_builder"

module Dependabot
  module Uv
    # UV extends Python's authenticated URL builder for private registry access.
    # Currently inherits all behavior from Python::AuthedUrlBuilder.
    class AuthedUrlBuilder < Dependabot::Python::AuthedUrlBuilder
    end
  end
end
