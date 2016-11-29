class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_darwin_amd64.zip'
  sha256 'c1e004ad2bff4e92edb13cf32a18b67b5178fc3597a844beeda09cc4f9c30b65'
  version '0.7.13'
  devel do
    url 'https://releases.hashicorp.com/terraform/0.8.0-rc1/terraform_0.8.0-rc1_darwin_amd64.zip'
    sha256 '8b2284c1b4b61044771731000d781786432c149f918040bd698f5c9781e76772'
    version '0.8.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
