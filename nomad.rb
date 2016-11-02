class Nomad < Formula
  desc 'A Distributed, Highly Available, Datacenter-Aware Scheduler'
  homepage 'https://www.nomadproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/nomad/0.4.1/nomad_0.4.1_darwin_amd64.zip'
  sha256 '5f2d52c73e992313e803fb29b6957ad1b754ed6e68bed5fa9fbe9b8e10a67aeb'
  version '0.4.1'
  devel do
    url 'https://releases.hashicorp.com/nomad/0.5.0-rc1/nomad_0.5.0-rc1_darwin_amd64.zip'
    sha256 '4e9c53c3e8d8fd6b34177b62d7b8e882ba1b8ea0d80decc0030e90c09df04e91'
    version '0.5.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
