class Nomad < Formula
  homepage 'https://www.nomadproject.io'
  version '0.3.2'

  url 'https://releases.hashicorp.com/nomad/0.3.2/nomad_0.3.2_darwin_amd64.zip'
  sha256 '96808b9b8056490026327bdc6614e1813cee7d42978676e0024085709fd3fcac'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
