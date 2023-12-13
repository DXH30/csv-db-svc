Gem::Specification.new do |spec|
    spec.name          = "csv-db-svc"
    spec.version       = "0.1.1"
    spec.authors       = ["Didik Hadumi Setiaji"]
    spec.email         = ["dhs0223@gmail.com"]
    spec.summary       = %q{CSV Database using Sinatra}
    spec.description   = %q{This is a simple app to utilize csv data into database system}
    spec.homepage      = "https://dxh30.my.id"
    spec.license       = "MIT"
  
    spec.files         = Dir["{lib}/**/*"] + ["csv-db-svc.gemspec"]
    spec.require_paths = ["lib"]

    spec.metadata      =  { "github_repo" => "ssh://github.com/dxh30/csv-db-svc" }
  
    # Add dependencies here
    # spec.add_dependency "example_dependency", "~> 1.0"
  
    # Add development dependencies here
    # spec.add_development_dependency "example_dev_dependency", "~> 1.0"
  end