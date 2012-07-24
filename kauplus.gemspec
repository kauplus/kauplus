# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kauplus/version"

Gem::Specification.new do |s|
  s.name        = "kauplus"
  s.version     = Kauplus::VERSION
  s.authors     = ["Kauplus Social Commerce"]
  s.email       = ["suporte@kauplus.com.br"]
  s.homepage    = "http://dev.kauplus.com.br/"
  s.summary     = %q{Kauplus - Cliente da API}
  s.description = %q{Esta gem é um cliente que permite desenvolvedores se conectarem aos web services do Kauplus.}

  s.rubyforge_project = "kauplus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # dependencies
  s.add_dependency 'rest-client', '>= 1.6.7'
  s.add_dependency 'activesupport', '>= 3.1.0'
end
