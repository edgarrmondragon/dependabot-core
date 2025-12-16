# typed: strict
# frozen_string_literal: true

require "toml-rb"
require "sorbet-runtime"
require "dependabot/python/file_parser"
require "dependabot/python/pip_compile_file_matcher"
require "dependabot/python/requirement"
require "dependabot/python/shared/python_requirement_parser"

module Dependabot
  module Python
    class FileParser
      # Python-specific requirement parser that extends the shared base.
      # Adds Pipfile and setup.py support on top of the shared functionality.
      class PythonRequirementParser < Dependabot::Python::Shared::PythonRequirementParser
        extend T::Sig

        sig { override.returns(T::Array[T.nilable(String)]) }
        def base_requirements
          [
            pipfile_python_requirement,
            pyproject_python_requirement,
            pip_compile_python_requirement,
            python_version_file_version,
            runtime_file_python_version,
            setup_file_requirement
          ]
        end

        sig { override.params(file: Dependabot::DependencyFile).returns(T::Boolean) }
        def compiled_file?(file)
          T.must(pip_compile_file_matcher).lockfile_for_pip_compile_file?(file)
        end

        sig { override.returns(T.class_of(Dependabot::Python::Requirement)) }
        def requirement_class
          Dependabot::Python::Requirement
        end

        private

        # Parses the Pipfile content to extract the Python version requirement.
        sig { returns(T.nilable(String)) }
        def pipfile_python_requirement
          return unless pipfile

          parsed_pipfile = TomlRB.parse(T.must(pipfile).content)
          requirement =
            parsed_pipfile.dig("requires", "python_full_version") ||
            parsed_pipfile.dig("requires", "python_version")
          return unless requirement&.match?(/^\d/)

          requirement
        end

        sig { returns(T.nilable(String)) }
        def setup_file_requirement
          return unless setup_file

          req = T.must(T.must(setup_file).content)
                 .match(/python_requires\s*=\s*['"](?<req>[^'"]+)['"]/)
                 &.named_captures&.fetch("req")&.strip

          requirement_class.new(req)
          req
        rescue Gem::Requirement::BadRequirementError
          nil
        end

        sig { returns(T.nilable(PipCompileFileMatcher)) }
        def pip_compile_file_matcher
          @pip_compile_file_matcher = T.let(
            PipCompileFileMatcher.new(pip_compile_files),
            T.nilable(PipCompileFileMatcher)
          )
        end

        sig { returns(T.nilable(Dependabot::DependencyFile)) }
        def pipfile
          dependency_files.find { |f| f.name == "Pipfile" }
        end

        sig { returns(T.nilable(Dependabot::DependencyFile)) }
        def pipfile_lock
          dependency_files.find { |f| f.name == "Pipfile.lock" }
        end

        sig { returns(T.nilable(Dependabot::DependencyFile)) }
        def setup_file
          dependency_files.find { |f| f.name == "setup.py" }
        end
      end
    end
  end
end
