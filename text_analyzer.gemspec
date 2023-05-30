
Gem::Specification.new do |spec|
  spec.name          = 'text_analyzer'
  spec.version       = '0.1.0'
  spec.authors       = ['AntonSosnitskiy']
  spec.email         = ['antoniotetris150@gmail.com']
  spec.summary       = 'Text Analyzer library for Ruby'
  spec.description  = 'A library for frequency analysis of text files with stopwords and lemmatization settings.'
  spec.homepage      = 'https://github.com/VasekVasiliy/textanalyzer'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{lib}/**/*') + ['LICENSE.txt', 'README.md']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lingua-stemmer'

end
