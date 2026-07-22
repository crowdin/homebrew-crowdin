#!/usr/bin/env ruby
# Regenerates Formula/crowdin@5.rb from .github/templates/crowdin@5.rb.erb.
# Usage: update-formula.rb <version> <checksums-file>

require "erb"

version, checksums_path = ARGV
abort "usage: #{File.basename($PROGRAM_NAME)} <version> <checksums-file>" unless version && checksums_path
abort "invalid version: #{version}" unless version.match?(/\A[0-9A-Za-z.-]+\z/)

checksums = File.readlines(checksums_path).to_h do |line|
  checksum, file = line.split
  [file, checksum]
end

sha = %w[darwin-arm64 darwin-x64 linux-arm64 linux-x64].to_h do |platform|
  checksum = checksums["crowdin-#{platform}"]
  abort "no checksum for crowdin-#{platform} in #{checksums_path}" unless checksum
  abort "malformed sha256 for crowdin-#{platform}: #{checksum}" unless checksum.match?(/\A[0-9a-f]{64}\z/)
  [platform, checksum]
end

template = File.read(File.expand_path("../templates/crowdin@5.rb.erb", __dir__))
formula = ERB.new(template).result_with_hash(version: version, sha: sha)
File.write(File.expand_path("../../Formula/crowdin@5.rb", __dir__), formula)
