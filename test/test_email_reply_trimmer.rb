# frozen_string_literal: true

require 'minitest/autorun'
require 'runger_email_reply_trimmer'

class TestRungerEmailReplyTrimmer < Minitest::Test
  EMAILS  = Dir['test/emails/*.txt'].map  { |path| File.basename(path) }
  TRIMMED = Dir['test/trimmed/*.txt'].map { |path| File.basename(path) }

  EMBEDDED_EMAILS = %w[
    email_headers_1
    email_headers_2
    email_headers_3
    email_headers_4
    embedded_email_10
    embedded_email_german_3
    embedded_email_spanish_2
    forwarded_message
    forwarded_gmail
    forwarded_apple
  ].freeze
  def test_all_emails_have_a_matching_reply
    assert_equal(EMAILS, TRIMMED, 'Files in /emails and /trimmed folders should match 1-to-1.')
  end

  def test_normalize_line_endings_email_has_windows_line_endings
    assert_match(/\r\n/, File.read('test/emails/normalize_line_endings.txt'))
  end

  def test_is_reply_at_end?
    Timeout.timeout(1) { assert_nil(RungerEmailReplyTrimmer.send(:is_reply_at_end?, 'bq' * 100)) }
  end

  EMAILS.each do |filename|
    name = File.basename(filename, '.txt')
    define_method("test_#{name}") do
      assert_equal(trimmed(filename), trim(filename), "[TRIMMED] EMAIL: #{filename}")
    end
  end

  EMBEDDED_EMAILS.each do |name|
    filename = "#{name}.txt"
    define_method("test_embedded_extraction_for_#{name}") do
      e, b = extract_embedded_email(filename)
      assert_equal(e, embedded(filename), "[EMBEDDED] EMAIL: #{filename}")
      assert_equal(b, before(filename), "[BEFORE] EMAIL: #{filename}")
    end
  end

  def trim(filename)
    RungerEmailReplyTrimmer.trim(email(filename))
  end

  def extract_embedded_email(filename)
    RungerEmailReplyTrimmer.extract_embedded_email(email(filename))
  end

  def email(filename)
    File.read("test/emails/#{filename}").strip
  end

  def trimmed(filename)
    File.read("test/trimmed/#{filename}").strip
  end

  def embedded(filename)
    File.read("test/embedded/#{filename}").strip
  end

  def before(filename)
    File.read("test/before/#{filename}").strip
  end
end
