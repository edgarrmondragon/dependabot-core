# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"
require "dependabot/uv/file_parser"
require "dependabot/uv/requirements_file_matcher"
require "dependabot/uv/requirement"
require "dependabot/python/shared/python_requirement_parser"

module Dependabot
  module Uv
    class FileParser
      # UV-specific requirement parser that extends the shared base.
      # Uses UV's RequirementsFileMatcher for compiled file detection.
      class PythonRequirementParser < Dependabot::Python::Shared::PythonRequirementParser
        extend T::Sig

        sig { override.returns(T::Array[T.nilable(String)]) }
        def base_requirements
          [
            pyproject_python_requirement,
            pip_compile_python_requirement,
            python_version_file_version,
            runtime_file_python_version
          ]
        end

        sig { override.params(file: Dependabot::DependencyFile).returns(T::Boolean) }
        def compiled_file?(file)
          T.must(pip_compile_file_matcher).compiled_file?(file)
        end

        sig { override.returns(T.class_of(Dependabot::Uv::Requirement)) }
        def requirement_class
          Dependabot::Uv::Requirement
        end

        private

        sig { returns(T.nilable(RequirementsFileMatcher)) }
        def pip_compile_file_matcher
          @pip_compile_file_matcher = T.let(
            RequirementsFileMatcher.new(pip_compile_files),
            T.nilable(RequirementsFileMatcher)
          )
        end
      end
    end
  end
end
