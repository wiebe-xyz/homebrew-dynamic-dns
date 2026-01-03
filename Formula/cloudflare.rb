class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "8ed4cb6514926823913485d8ee26736b845efb9b2f1e76b88bc9c3f7d86acb04"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "12fbb95f89641e37756214133ed21dea6635de4a56c72ca13af38a60df3dfaa2"
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
