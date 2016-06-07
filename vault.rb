class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault/0.5.3/vault_0.5.3_darwin_amd64.zip'
  sha256 '31e7eff07c202cf2166ac63457054da59a1f4f49e7ad079b38316efadbb79e32'
  version '0.5.3'
  def install
    bin.install Dir['*']
  end
end
