class Nomad < Formula
  homepage 'https://www.nomadproject.io'
  version '0.3.1'

  url 'https://releases.hashicorp.com/nomad/0.3.1/nomad_0.3.1_darwin_amd64.zip'
  sha256 'c300a3b5c195fbccf26dfcdb756b4c953ca0e5e566a41fce1d10ef1947ec4279'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
