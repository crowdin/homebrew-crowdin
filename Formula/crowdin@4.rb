class CrowdinAT4 < Formula
  desc "Crowdin CLI is a command-line tool that allows you to manage and synchronize localization resources with your Crowdin project."
  homepage "https://crowdin.github.io/crowdin-cli/"
  url "https://github.com/crowdin/crowdin-cli/releases/download/4.15.0/crowdin-cli.zip"
  sha256 "c159ee285c354aad96efa60a797e9dd029bf6cf1b2154a97417c8a8d389a52ad"
  version "4.15.0"

  keg_only :versioned_formula

  depends_on "openjdk"

  def install
    libexec.install "crowdin-cli.jar"
    bin.write_jar_script libexec/"crowdin-cli.jar", "crowdin"
  end

  test do
    generate_output = shell_output("#{bin}/crowdin init").chomp
    assert_predicate testpath/"crowdin.yml", :exist?
    assert_match /^Generating Crowdin CLI configuration skeleton .*crowdin\.yml\'- OK$/, generate_output
    lint_output = shell_output("#{bin}/crowdin config lint", 1).split("\n")
    assert_match /^`Source` parameter is empty$/, lint_output[0]
    assert_match /^`Translation` parameter is empty$/, lint_output[1]
  end
end
