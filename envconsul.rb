class Envconsul < Formula
  homepage 'https://github.com/hashicorp/envconsul'
  version '0.6.0'

  url 'https://releases.hashicorp.com/envconsul/0.6.0/envconsul_0.6.0_darwin_amd64.zip'
  sha256 'e54721e5cd6c64a3e9669cb98196d6a1c8303ea5d30ddb11f13d76877d5c7f79'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
