class Serf < Formula
  desc 'Service orchestration and management tool'
  homepage 'https://www.serfdom.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/serf/0.8.0/serf_0.8.0_darwin_amd64.zip'
  sha256 '61bd6b853b33cc93d1de5ff639555360f677fffd2e5b9534e37faa20fa88387a'
  version '0.8.0'
  def install
    bin.install Dir['*']
  end
end
