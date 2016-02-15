require 'formula'

class Vault < Formula
  homepage 'https://www.vaultproject.io'
  version '0.5.0'

  url 'https://releases.hashicorp.com/vault/0.5.0/vault_0.5.0_darwin_amd64.zip'
  sha256 '8f5ca5927f876737566a23442f098afa1ed3dc9d5b238c3c8f7563e06ab6c64c'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
