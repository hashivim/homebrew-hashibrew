class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  version '0.10.0'

  url 'https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_darwin_amd64.zip'
  sha256 'cb1d9768306466d566abc79d83911983ace6a9a6c0a6657dc7eaab03cabd2e21'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
