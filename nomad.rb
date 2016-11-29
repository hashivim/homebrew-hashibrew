class Nomad < Formula
  desc 'A Distributed, Highly Available, Datacenter-Aware Scheduler'
  homepage 'https://www.nomadproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/nomad/0.5.0/nomad_0.5.0_darwin_amd64.zip'
  sha256 'a063a1d1af7012da32dfe11ca8b02324e83e242ff8e8bd27dc00553f1b1a0499'
  version '0.5.0'
  def install
    bin.install Dir['*']
  end
end
