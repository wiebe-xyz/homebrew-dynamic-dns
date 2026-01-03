class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "e346fe398483b0f158930f4038f8a9cb6484d196eae7679cc42139ce50e5916b"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "dcc8a9c2f7cb9faea56206556982d09a583f8178161212d4330ede9a0971b169"
    end
  end

  def install
    bin.install "cloudflare"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
