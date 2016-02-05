require 'formula'

class Nomad < Formula
  homepage 'http://www.nomadproject.io'
  version '0.2.3'

  url "https://releases.hashicorp.com/nomad/#{version}/nomad_#{version}_darwin_amd64.zip"
  sha256 'ad7caf0641bb7be2aab0dd2496545461010cbc667a857aaac4f10b7296c59ca9'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end