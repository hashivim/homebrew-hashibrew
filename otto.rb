require 'formula'

class Otto < Formula
  homepage 'http://www.ottoproject.io'
  version '0.2.0'

  url "https://releases.hashicorp.com/otto/#{version}/otto_#{version}_darwin_amd64.zip"
  sha256 '411d99f1e682ca8d3c817104e3f4f215a7bb65016124c10e4333682c752ba09e'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
