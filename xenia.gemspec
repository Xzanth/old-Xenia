Gem::Specification.new do |gem|
  gem.name          = "Xenia"
  gem.version       = "0.0.3"
  gem.authors       = ["Jonas Osborn"]
  gem.description   = "Cinch bot for use in #midair.pug on quakenet"
  gem.summary       = "Midair pug bot"
  gem.homepage      = "https://github.com/Xzanth/xenia"
  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.require_paths = ["lib"]

  gem.add_dependency("pugbot", "~> 0.1")
  gem.add_dependency("cinch-integrate", "~> 0.0.3")
  gem.add_dependency("cinch-auth-autovoice", "~> 0.0.1")
  gem.add_dependency("dm-sqlite-adapter", "~> 1.2.0")
  gem.add_dependency("dm-migrations", "~> 1.2.0")
  gem.add_dependency("sqlite3", "~> 1.3.11")
end
