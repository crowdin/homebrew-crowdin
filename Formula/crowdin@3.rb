class CrowdinAT3 < Formula
  desc "Crowdin CLI is a command-line tool that allows you to manage and synchronize localization resources with your Crowdin project."
  homepage "https://support.crowdin.com/cli-tool/"
  url "https://downloads.crowdin.com/cli/v3/crowdin-cli-3.13.0.zip"
  sha256 "610bc239d30830c12d4f62bd5815a9e719833467880af813b341a75fe0f80d92"
  version "3.13.0"

  keg_only :versioned_formula

  depends_on "openjdk"

  def install
    libexec.install "crowdin-cli.jar"
    bin.write_jar_script libexec/"crowdin-cli.jar", "crowdin"
  end

  test do
    generate_output = shell_output("#{bin}/crowdin generate").chomp
    assert_predicate testpath/"crowdin.yml", :exist?
    assert_match /^Generating Crowdin CLI configuration skeleton .*crowdin\.yml\'- OK$/, generate_output
    lint_output = shell_output("#{bin}/crowdin lint", 1).split("\n")
    assert_match /^`Source` parameter is empty$/, lint_output[0]
    assert_match /^`Translation` parameter is empty$/, lint_output[1]
  end
end
