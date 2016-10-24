class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault/0.6.2/vault_0.6.2_darwin_amd64.zip'
  sha256 'b5e6fadfed6a5226d96714f5ddcf7e042f3424d7489875af125543c967a706b7'
  version '0.6.2'
  def install
    bin.install Dir['*']
  end
end
