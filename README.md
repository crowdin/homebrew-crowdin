# Homebrew Tap for Crowdin

### Status

[![homebrew downloads](https://img.shields.io/homebrew/installs/dy/crowdin?logo=homebrew)](https://formulae.brew.sh/formula/crowdin)

### Installation

Add Crowdin tap to your list of Homebrew taps:

```console
brew tap crowdin/crowdin
```

To install Crowdin CLI:

```console
brew install crowdin@5
```

See the [official documentation](https://crowdin.github.io/crowdin-cli/) for more details.

### Usage

Use the following method to run the app:

```console
crowdin
```

### Update

```console
brew upgrade crowdin/crowdin/crowdin@5
```

### How to publish a new version?

Run the [Publish workflow](https://github.com/crowdin/homebrew-crowdin/actions/workflows/publish.yml) with the version to publish. It regenerates [crowdin@5.rb](https://github.com/crowdin/homebrew-crowdin/blob/master/Formula/crowdin%405.rb) from [a template](.github/templates/crowdin%405.rb.erb) using the checksums file attached to the [crowdin-cli release](https://github.com/crowdin/crowdin-cli/releases) and pushes the change.

To update the formula manually, run the same script locally and create a Pull Request:

```console
curl -fsSL https://github.com/crowdin/crowdin-cli/releases/download/<version>/crowdin-cli_checksums.sha256 -o checksums.sha256
ruby .github/scripts/update-formula.rb <version> checksums.sha256
```
