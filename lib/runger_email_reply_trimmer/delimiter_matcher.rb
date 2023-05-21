# frozen_string_literal: true

module DelimiterMatcher
  module_function

  DELIMITER_CHARACTERS = '-_,=+~#*ᐧ—'
  DELIMITER_REGEX      = /^[[:blank:]]*[#{Regexp.escape(DELIMITER_CHARACTERS)}]+[[:blank:]]*$/

  def match?(line)
    line =~ DELIMITER_REGEX
  end
end
