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
brew install crowdin@3
```

See the [official documentation](https://crowdin.github.io/crowdin-cli/) for more details.

### Usage

Use the following method to run the app:

```console
crowdin
```

### Update

```console
brew upgrade crowdin/crowdin/crowdin@3
```

### How to update sha256 checksum?

1. Download [zip-archive](https://downloads.crowdin.com/cli/v3/crowdin-cli.zip)
2. Execute command `shasum -a 256 crowdin-cli.zip`
3. Update `sha256` value in the [crowdin@3.rb](https://github.com/crowdin/homebrew-crowdin/blob/master/Formula/crowdin%403.rb) file
4. Create Pull Request.
