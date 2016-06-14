class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault/0.6.0/vault_0.6.0_darwin_amd64.zip'
  sha256 '75a884f3f209f2fdd942fc4b5c80a611c58380ccf249f6dc4d3b1c35373d87b2'
  version '0.6.0'
  def install
    bin.install Dir['*']
  end
end
