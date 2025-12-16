# typed: strong
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/python/package/package_registry_finder"
require "dependabot/python/package/package_details_fetcher"

module Dependabot
  module Uv
    # UV extends Python's package registry handling for PyPI.
    module Package
      # Re-export constants from Python::Package for backward compatibility
      CREDENTIALS_USERNAME = Dependabot::Python::Package::CREDENTIALS_USERNAME
      CREDENTIALS_PASSWORD = Dependabot::Python::Package::CREDENTIALS_PASSWORD
      APPLICATION_JSON = Dependabot::Python::Package::APPLICATION_JSON
      APPLICATION_TEXT = Dependabot::Python::Package::APPLICATION_TEXT
      CPYTHON = Dependabot::Python::Package::CPYTHON
      PYTHON = Dependabot::Python::Package::PYTHON
      UNKNOWN = Dependabot::Python::Package::UNKNOWN
      MAIN_PYPI_INDEXES = Dependabot::Python::Package::MAIN_PYPI_INDEXES
      VERSION_REGEX = Dependabot::Python::Package::VERSION_REGEX

      # UV extends Python's package registry finder for PyPI registry discovery.
      # Currently inherits all behavior from Python::Package::PackageRegistryFinder.
      class PackageRegistryFinder < Dependabot::Python::Package::PackageRegistryFinder
      end

      # UV extends Python's package details fetcher for PyPI package metadata.
      # Currently inherits all behavior from Python::Package::PackageDetailsFetcher.
      class PackageDetailsFetcher < Dependabot::Python::Package::PackageDetailsFetcher
      end
    end
  end
end
