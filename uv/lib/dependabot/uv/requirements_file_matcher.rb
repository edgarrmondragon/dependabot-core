# typed: strong
# frozen_string_literal: true

require "dependabot/python/pip_compile_file_matcher"

module Dependabot
  module Uv
    # UV uses the same pip-compile file matching logic as Python.
    # Extends Python's PipCompileFileMatcher with a UV-friendly method alias.
    class RequirementsFileMatcher < Dependabot::Python::PipCompileFileMatcher
      extend T::Sig

      # Alias for UV's preferred method name
      sig { params(file: Dependabot::DependencyFile).returns(T::Boolean) }
      def compiled_file?(file)
        lockfile_for_pip_compile_file?(file)
      end
    end
  end
end
