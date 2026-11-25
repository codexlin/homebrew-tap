# Homebrew Tap for UnoSkills

[UnoSkills](https://github.com/codexlin/UnoSkills) manages local skills and stacks for AI coding agents.

```sh
brew install codexlin/tap/unoskills
unoskills --version
```

The formula supports Apple Silicon on macOS 14 or later and x86_64 Linux with system glibc 2.39 or later. Homebrew supplies OpenSSL 3 on Linux. See [Homebrew's system requirements](https://docs.brew.sh/Installation) for supported Homebrew environments.

Update with `brew update && brew upgrade unoskills`. The CLI keeps its library and settings in `~/.unoskills`.

## Updating the formula

After a stable [UnoSkills release](https://github.com/codexlin/UnoSkills/releases/latest), download `unoskills-macos-arm64`, `unoskills-linux-x64`, and `SHA256SUMS.txt` from that tag. Verify both binaries against the manifest. Update the version, both tagged URLs and their SHA-256 values in `Formula/unoskills.rb`, then open a pull request in this tap. Tap CI installs and tests the formula on both platforms.
