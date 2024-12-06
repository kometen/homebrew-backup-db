class BackupDb < Formula
  desc "Read secrets from Azure Key Vault and backup a PostgreSQL database"
  homepage "https://github.com/kometen/backup-db"
  url "https://github.com/kometen/backup-db/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "19b46fd1a90645f400ee80b09f425e5fbae35a2c5efad215ba260f94c424323f"
  license "MIT"

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
