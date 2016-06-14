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
    url 'https://releases.hashicorp.com/nomad/0.4.0-rc1/nomad_0.4.0-rc1_darwin_amd64.zip'
    sha256 '7dc8779a5821cf98667f7c4b93d5d7d5c3ac64c10631c2e4dd77cb79a6d9f139'
    version '0.4.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
