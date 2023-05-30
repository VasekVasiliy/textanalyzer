require_relative 'test_helper'

require 'text_analyzer'

class TestTextAnalyzer < Minitest::Test
  def test_analyze_folder_with_stopwords
    analyzer = TextAnalyzer::Analyzer.new(stopwords: ['and', 'the'], lemmatize: false)
    folder_path = './text_files'

    word_counts = analyzer.analyze_folder(folder_path)

    assert_equal 4, word_counts['sample']
    assert_equal 3, word_counts['text']
    assert_equal 2, word_counts['file']
    assert_equal 2, word_counts['frequency']
    assert_equal 2, word_counts['analysis']
    assert_equal 0,word_counts['and']
    assert_equal 0,word_counts['the']
  end

  def test_analyze_folder_with_lemmatization
    analyzer = TextAnalyzer::Analyzer.new(stopwords: [], lemmatize: true)
    folder_path = './text_files'

    word_counts = analyzer.analyze_folder(folder_path)

    assert_equal 4, word_counts['sampl']
    assert_equal 3, word_counts['text']
    assert_equal 2, word_counts['file']
    assert_equal 2, word_counts['frequenc']
    assert_equal 2, word_counts['analysi']
  end
end
