class CrowdinAT2 < Formula
  desc "Command-line tool allows you to manage resources with crowdin.com"
  homepage "https://support.crowdin.com/cli-tool/"
  url "https://downloads.crowdin.com/cli/v2/crowdin-cli-2.0.30.zip"
  sha256 "7066ce25339107c00b82918ef0c3b8d4913e3dedbafa677b2b50f12c45f6d4f8"
  version "2.0.30"

  keg_only :versioned_formula

  depends_on "openjdk"

  def install
    libexec.install "crowdin-cli.jar"
    bin.write_jar_script libexec/"crowdin-cli.jar", "crowdin"
  end

  test do
    generate_output = shell_output("#{bin}/crowdin generate").chomp
    assert_predicate testpath/"crowdin.yml", :exist?
    assert_match /^Generates Crowdin CLI configuration skeleton .*crowdin\.yml\'- OK$/, generate_output
    lint_output = shell_output("#{bin}/crowdin lint", 1).split("\n")
    lint_output.each do |line|
      assert_match /^Project [^ ]+ is empty$/, line
    end
  end
end
