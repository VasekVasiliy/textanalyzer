# frozen_string_literal: true

require_relative "text_analyzer/version"

require 'rubygems'
require 'stemmer'

module TextAnalyzer
  class Analyzer
    def initialize(stopwords: [], lemmatize: false)
      @stopwords = stopwords
      @lemmatize = lemmatize
    end

    def analyze_folder(folder_path)
      word_counts = Hash.new(0)
      Dir.glob("#{folder_path}/*.txt").each do |file_path|
        analyze_file(file_path, word_counts)
      end
      word_counts
    end

    private

    def analyze_file(file_path, word_counts)
      File.open(file_path, 'r') do |file|
        file.each_line do |line|
          words = line.downcase.scan(/\w+/)
          words = lemmatize_words(words) if @lemmatize
          words.reject! { |word| @stopwords.include?(word) }
          words.each { |word| word_counts[word] += 1 }
        end
      end
    end

    def lemmatize_words(words)
      words.map { |word| word.stem }
    end
  end
end
