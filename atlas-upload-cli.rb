require 'formula'

class AtlasUploadCli < Formula
  homepage 'https://github.com/hashicorp/atlas-upload-cli'
  version '0.2.0'

  url 'https://releases.hashicorp.com/atlas-upload-cli/0.2.0/atlas-upload-cli_0.2.0_darwin_amd64.zip'
  sha256 '978fec88b880b62dea0b1b2a8b01f3b096ebcdae1a931e8e7e3787191c641e25'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
