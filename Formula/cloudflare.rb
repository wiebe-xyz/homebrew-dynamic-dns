class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "2308fe909afcd7e4c41cb24dbe19d698b7915e9872d146c968316b0a3122807d"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "0ef61853e0a93a61ace4a7581515775c610effcee16621437c3662e787541e53"
    end
  end

  def install
    bin.install "cloudflare"
  end

  service do
    run [opt_bin/"cloudflare"]
    run_type :interval
    interval 300
    environment_variables HOME: ENV["HOME"]
    log_path var/"log/cloudflare-ddns.log"
    error_log_path var/"log/cloudflare-ddns.log"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
