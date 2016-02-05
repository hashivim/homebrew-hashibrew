require 'formula'

class Vault < Formula
  homepage 'http://www.vaultproject.io'
  version '0.4.1'

  url "https://releases.hashicorp.com/vault/#{version}/vault_#{version}_darwin_amd64.zip"
  sha256 'cdf4f8bb863550e6b29aa44254ed00968f69c9e6b7e9e8c83d70151fe905bd99'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
