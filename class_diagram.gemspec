# frozen_string_literal: true

require_relative "lib/class_diagram/version"

Gem::Specification.new do |spec|
  spec.name = "class_diagram"
  spec.version = ClassDiagram::VERSION
  spec.summary = %q{Generates class diagrams for Ruby files}
  spec.description = <<~DESCRIPTION
    Generates class diagrams and package diagrams for Ruby files.
  DESCRIPTION

  spec.author = "Christopher Voltz"
  spec.email = "christopher@voltz.us"
  spec.homepage = "https://github.com/cvoltz/class_diagram"
  spec.license = "GPL v2"
  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/cvoltz/class_diagram/issues",
    "changelog_uri" => "https://github.com/cvoltz/class_diagram/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://www.rubydoc.info/gems/class_diagram",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/cvoltz/class_diagram"
  }

  spec.bindir = "exe"
  spec.files = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.extra_rdoc_files = Dir["README.md", "CHANGES.md", "LICENSE.txt"]
  spec.rdoc_options += [
    "--title", "Class Diagram - #{spec.summary}",
    "--main", "README.md",
    "--line-numbers",
    "--inline-source",
    "--quiet"
  ]

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "parser", ">= 2.7.2.0"
end
