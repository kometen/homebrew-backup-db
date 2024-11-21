class BackupDb < Formula
  desc "Read secrets from Azure Key Vault and backup a PostgreSQL database"
  homepage "https://github.com/kometen/backup-db"
  url "https://github.com/kometen/backup-db/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5635249ad9f8d5cdbd493fb4fdc94663cabb1fc1f0b98a6e4a5b0bd4c2095765"
  license "MIT"

  bottle do
    root_url "https://github.com/kometen/homebrew-backup-db/releases/download/backup-db-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5c6dac479ffb848818e63df2ad8ab99fc4046d5ce4242864ad6182da4fdbffb9"
    sha256 cellar: :any_skip_relocation, ventura:       "fe104c35361ae661b40c405a6f5c5b3275a7fae0bc2d86426341429c2299c731"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a93aca31d58c14af1aa7a21a5255967296fa07633e12f733f73d9e09dc41f597"
  end

  depends_on "rust" => :build
  depends_on "openssl@3.4"

  def install
    system "cargo", "install", *std_cargo_args

    # Install binary
    bin.install "target/release/backup_db"
  end

  test do
    output = shell_output("#{opt_bin}/backup_db --help | /usr/bin/head -1 | tr -d '\n' 2>&1")
    expected = "Usage: backup_db --namespace <NAMESPACE>"
    assert_match expected, output

    assert_match version.to_s, shell_output("#{opt_bin}/backup_db --version")
  end
end
