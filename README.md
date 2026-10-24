# Homebrew Kodelet

This is the official Homebrew tap for [Kodelet](https://github.com/jingkaihe/kodelet), a lightweight agentic SWE Agent for software engineering and production operations.

## Installation

```bash
# Add the tap
brew tap jingkaihe/kodelet

# Install kodelet
brew install kodelet
```

Or install directly:

```bash
brew install jingkaihe/kodelet/kodelet
```

For TUI dictation and live voice, install the optional audio helper:

```bash
brew install jingkaihe/kodelet/kodelet-audio
```

Homebrew installs the required audio libraries. macOS binaries require macOS 15 or later and Homebrew's standard installation prefix. Allow microphone access for your terminal, and enable transcription or realtime voice in Kodelet's server configuration.

## Updating

To update to the latest version:

```bash
brew update
brew upgrade kodelet
```

## Usage

After installation, you can use kodelet:

```bash
kodelet --help
kodelet run "your query here"
kodelet chat  # Interactive mode
```

## About

This tap is automatically maintained. The formula is updated whenever a new release is published to the main [kodelet repository](https://github.com/jingkaihe/kodelet).

For more information about kodelet, visit: https://github.com/jingkaihe/kodelet
