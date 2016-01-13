require_relative "../../lib/file_diff"
require "test/unit"

class FileDiffTest < Test::Unit::TestCase

  def test_perform
    files_directory = "#{File.dirname(__FILE__)}/../files/"

    assert_equal([[1, "*", "Some|Another"],
                  [2, "-", "Simple"],
                  [3, "", "Text"],
                  [4, "", "File"],
                  [5, "+", "With"],
                  [6, "+", "Additional"],
                  [7, "+", "Lines"]],
                 FileDiff.perform("#{files_directory}1.txt", "#{files_directory}2.txt"))

    assert_raise(ArgumentError) do
      FileDiff.perform("#{files_directory}1.txt")
    end
  end

  def test_get_diff
    assert_raise(FileDiff::ProcessingError) do
      FileDiff.new('').get_diff
    end
  end

end