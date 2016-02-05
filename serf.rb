require 'formula'

class Serf < Formula
  homepage 'http://www.serfdom.io'
  version '0.7.0'

  url "https://releases.hashicorp.com/serf/#{version}/serf_#{version}_darwin_amd64.zip"
  sha256 '30ab3f2fe65cbef0ce1cefa27c7aa27043fc3634c52a2f46d8921964b1ab2380'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end