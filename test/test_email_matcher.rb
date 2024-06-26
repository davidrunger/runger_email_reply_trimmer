# frozen_string_literal: true

require 'minitest/autorun'
require 'runger_email_reply_trimmer'
require 'timeout'

class TestRungerEmailReplyTrimmer < Minitest::Test
  def test_does_not_hang_when_no_embedded_email_is_found
    Timeout.timeout(5) do
      EmbeddedEmailMatcher.match?(example('does_not_contain_embedded_email.txt'))
    end
  end

  def example(filename)
    File.read("test/matchers/#{filename}").strip
  end
end
