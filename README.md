# Homebrew Tap for Crowdin

### Installation

Add Crowdin tap to your list of Homebrew taps:

```console
brew tap crowdin/crowdin
```

To install Crowdin CLI v3:

```console
brew install crowdin@3
```

To install Crowdin CLI v2:

```console
brew install crowdin@2
```

**Note!** Crowdin CLI v2 is no longer supported.

For more details see [Console Client](https://support.crowdin.com/cli-tool-v3/) and [Configuration File](https://support.crowdin.com/configuration-file-v3/) articles.

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
