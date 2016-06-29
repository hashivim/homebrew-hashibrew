class Nomad < Formula
  desc 'A Distributed, Highly Available, Datacenter-Aware Scheduler'
  homepage 'https://www.nomadproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/nomad/0.4.0/nomad_0.4.0_darwin_amd64.zip'
  sha256 '2f6bff636ae48343017e0e5edd4371f7abe434d1f70d95d7e28f08490c978c40'
  version '0.4.0'
  def install
    bin.install Dir['*']
  end
end
