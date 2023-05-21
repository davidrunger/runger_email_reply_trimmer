# frozen_string_literal: true

module QuoteMatcher
  module_function

  def match?(line)
    line =~ /^[[:blank:]]*>/
  end
end
