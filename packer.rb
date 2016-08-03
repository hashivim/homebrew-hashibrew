class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_darwin_amd64.zip'
  sha256 'fac621bf1fb43f0cbbe52481c8dfda2948895ad52e022e46f00bc75c07a4f181'
  version '0.10.1'
  def install
    bin.install Dir['*']
  end
end
