class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_darwin_amd64.zip'
  sha256 'e3f25ad619f35e10a4195c971d78f29abceb16877bbf2bd75182140373d02bd3'
  version '0.12.0'
  def install
    bin.install Dir['*']
  end
end
