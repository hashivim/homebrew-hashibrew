class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault/0.6.4/vault_0.6.4_darwin_amd64.zip'
  sha256 '83f680b5e2aaa4c1c2a1a5dbc7479e63186233b6cdda64e24b968f6f1856b676'
  version '0.6.4'
  def install
    bin.install Dir['*']
  end
end
