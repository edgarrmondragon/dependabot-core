# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/name_normaliser"

module Dependabot
  module Uv
    # UV extends Python's name normaliser for PEP 503 package name normalization.
    # Currently delegates all behavior to Python::NameNormaliser.
    module NameNormaliser
      extend T::Sig

      sig { params(name: String).returns(String) }
      def self.normalise(name)
        Dependabot::Python::NameNormaliser.normalise(name)
      end

      sig { params(name: String, extras: T::Array[String]).returns(String) }
      def self.normalise_including_extras(name, extras)
        Dependabot::Python::NameNormaliser.normalise_including_extras(name, extras)
      end
    end
  end
end
