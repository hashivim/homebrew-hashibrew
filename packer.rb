class Packer < Formula
  homepage 'https://www.packer.io'
  version '0.9.0'

  url 'https://releases.hashicorp.com/packer/0.9.0/packer_0.9.0_darwin_amd64.zip'
  sha256 'bd5f8ce38ceb866c3f1db2eb3d51091184dd021dd785d05bb47177b223fea9df'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
