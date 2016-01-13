require_relative 'file_diff/string_extensions'

class FileDiff
  class ReadFileError   < StandardError; end
  class ProcessingError < StandardError; end

  ## performs extracting diff and returns it as an array
  #
  def self.perform(*files)
    raise ArgumentError, 'At least 2 files are required' if files.size < 2

    instance = new(files)
    instance.read_files
    instance.get_diff
  end

  ## performs extracting diff and outputs it in readable format
  #
  def self.perform_with_output(*files)
    perform(*files).each do |diff_line|
      p " %01d %-2s %-2s " % diff_line
    end
  end

  def initialize(files)
    @files = files
  end

  ## process files and fill the @files array with lines array
  #
  def read_files
    @files.map! do |file|
      opened_file = File.open(file)
      begin
        opened_file.readlines
      rescue
        raise ReadFileError, "An error occured trying to read file #{file}"
      end
    end
  end

  ## generates diff into @result variable as an array according to README
  #
  def get_diff
    if @files.empty?
      raise ProcessingError, 'Diff cannot be generated, please call FileDiff class as it described in README'
    end

    counter_by_max_size = @files.map(&:size).max

    (0..(counter_by_max_size-1)).each.with_index.inject([]) do |result, (i,_)|
      related_lines = @files.map{|line| line[i].to_s.strip }
      uniq_not_empty_lines = related_lines.select(&:present?).uniq

      if uniq_not_empty_lines.count > 1
        identifier = '*'
        combined_line = uniq_not_empty_lines.join('|')
      elsif related_lines.first.present? && related_lines.any?(&:blank?)
        identifier = '-'
        combined_line = uniq_not_empty_lines.first
      elsif related_lines.first.blank? && related_lines.any?(&:present?)
        identifier = '+'
        combined_line = uniq_not_empty_lines.first
      else
        identifier = ''
        combined_line = related_lines.uniq.first
      end

      result << [i+1, identifier, combined_line]
    end
  end
end
