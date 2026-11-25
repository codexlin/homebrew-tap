class Unoskills < Formula
  desc "Local-first skill and stack manager for AI coding agents"
  homepage "https://github.com/codexlin/UnoSkills"
  version "0.8.8"
  license "MIT"

  on_macos do
    url "https://github.com/codexlin/UnoSkills/releases/download/v0.8.8/unoskills-macos-arm64", using: :nounzip
    sha256 "fc52ff270e4a81b5fb942c0185af46b71a5c0f203c5d39d928e983a0a5d514b2"

    depends_on arch: :arm64
    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/codexlin/UnoSkills/releases/download/v0.8.8/unoskills-linux-x64", using: :nounzip
    sha256 "ec84493b3f6738be87ad01d875fb676345ff9fbcca11efd95f313cd6e0cfe178"

    depends_on "patchelf" => :build
    depends_on "openssl@3"
    depends_on arch: :x86_64
  end

  def install
    if OS.linux?
      libc, libc_version = Utils.popen_read("getconf", "GNU_LIBC_VERSION").split
      unless libc == "glibc" && Version.new(libc_version) >= Version.new("2.39")
        odie "UnoSkills requires system glibc 2.39 or later on Linux."
      end

      bin.install "unoskills-linux-x64" => "unoskills"
      # Use the OpenSSL 3 libraries owned by Homebrew, including after brew upgrade.
      system "patchelf", "--add-rpath", Formula["openssl@3"].opt_lib, bin/"unoskills"
    else
      bin.install "unoskills-macos-arm64" => "unoskills"
    end
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_equal "unoskills #{version}", shell_output("#{bin}/unoskills --version").strip
  end
end
