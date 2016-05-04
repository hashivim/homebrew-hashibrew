class Otto < Formula
  desc 'Development and deployment made easy'
  homepage 'https://www.ottoproject.io'
  version '0.2.0'

  url 'https://releases.hashicorp.com/otto/0.2.0/otto_0.2.0_darwin_amd64.zip'
  sha256 '411d99f1e682ca8d3c817104e3f4f215a7bb65016124c10e4333682c752ba09e'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
