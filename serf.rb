class Serf < Formula
  desc 'Service orchestration and management tool'
  homepage 'https://www.serfdom.io'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_darwin_amd64.zip'
    sha256 '30ab3f2fe65cbef0ce1cefa27c7aa27043fc3634c52a2f46d8921964b1ab2380'
    version '0.7.0'
  end
  def install
    bin.install Dir['*']
  end
end
