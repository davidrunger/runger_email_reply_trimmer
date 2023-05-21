# frozen_string_literal: true

module EmptyLineMatcher
  module_function

  def match?(line)
    line =~ /^[[:blank:]]*$/
  end
end
