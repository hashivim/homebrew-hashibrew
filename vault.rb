class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/vault/0.5.3/vault_0.5.3_darwin_amd64.zip'
    sha256 '31e7eff07c202cf2166ac63457054da59a1f4f49e7ad079b38316efadbb79e32'
    version '0.5.3'
  end
  devel do
    url 'https://releases.hashicorp.com/vault/0.6.0-rc1/vault_0.6.0-rc1_darwin_amd64.zip'
    sha256 'ae09cd4bb507bd6d9da7c5ad8cd7cc5b472409f9099c12ecb4d47707cea05d4e'
    version '0.6.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
