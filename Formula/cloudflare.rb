class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "24ab32c2246a28cfc4fadb1557f2ff86fa020646eb529af9390d113c8c64f25d"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "ee4c4ecf5264dd0cd11c8372fbed05bf2a03124e308938272a2bf61397aa9d2d"
    end
  end

  def install
    bin.install "cloudflare"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
