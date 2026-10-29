class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "18d01f5300f1a68cb97bd82773ded3ffd0923189dae32c80d861b9857916539b"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "a9da582c84a7797ab4cb29835da6e73e2ca69b1a30c06b74e66a6e4e31781b63"
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
