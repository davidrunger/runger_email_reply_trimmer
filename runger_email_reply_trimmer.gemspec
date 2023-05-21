# frozen_string_literal: true

require_relative 'lib/runger_email_reply_trimmer/version'

Gem::Specification.new do |s|
  s.name = 'runger_email_reply_trimmer'
  s.version = RungerEmailReplyTrimmer::VERSION

  s.summary = 'Library to trim replies from plain text email.'
  s.description = 'RungerEmailReplyTrimmer is a library to trim replies from plain text email.'

  s.authors = ['David Runger', 'Régis Hanol']
  s.email = ['davidjrunger@gmail.com', 'regis+rubygems@hanol.fr']

  s.homepage = 'https://github.com/davidrunger/runger_email_reply_trimmer'
  s.license = 'MIT'

  s.require_paths = ['lib']
  s.files = Dir['**/*'].reject { |path| File.directory?(path) || path =~ /.*\.gem$/ }
  s.metadata['rubygems_mfa_required'] = 'true'
end
