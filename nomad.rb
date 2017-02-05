class Nomad < Formula
  desc 'A Distributed, Highly Available, Datacenter-Aware Scheduler'
  homepage 'https://www.nomadproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/nomad/0.5.4/nomad_0.5.4_darwin_amd64.zip'
  sha256 'f213415d09236edd39faccffa33851acd239048372561766eeb6e9f6b73fd14f'
  version '0.5.4'
  def install
    bin.install Dir['*']
  end
end
