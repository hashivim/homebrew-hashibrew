class Nomad < Formula
  homepage 'https://www.nomadproject.io'
  version '0.3.0'

  url 'https://releases.hashicorp.com/nomad/0.3.0/nomad_0.3.0_darwin_amd64.zip'
  sha256 'dd2d769ccceb532849072c4e088ebd1f338a0e60916cfe4317a2661716803894'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
