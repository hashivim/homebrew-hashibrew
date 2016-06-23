class Nomad < Formula
  desc 'A Distributed, Highly Available, Datacenter-Aware Scheduler'
  homepage 'https://www.nomadproject.io'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/nomad/0.3.2/nomad_0.3.2_darwin_amd64.zip'
    sha256 '96808b9b8056490026327bdc6614e1813cee7d42978676e0024085709fd3fcac'
    version '0.3.2'
  end
  devel do
    url 'https://releases.hashicorp.com/nomad/0.4.0-rc2/nomad_0.4.0-rc2_darwin_amd64.zip'
    sha256 '897f6c9c05b8cdfe4e7e03e31fd46b8cf0baed4a2b317e6cdfadeb8f500e234f'
    version '0.4.0-rc2'
  end
  def install
    bin.install Dir['*']
  end
end
