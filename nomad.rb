class Nomad < Formula
  homepage 'https://www.nomadproject.io'
  version '0.3.0-rc2'

  url 'https://releases.hashicorp.com/nomad/0.3.0-rc2/nomad_0.3.0-rc2_darwin_amd64.zip'
  sha256 '8c8a165257d9f21533e0b73fe34a686f14714c086d4cadfe33578acde6215d89'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
