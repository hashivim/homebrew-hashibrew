class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_darwin_amd64.zip'
    sha256 '23feb79263126877e6128a03c600cd626f6691a118a474694c5ad45cc5da9366'
    version '0.6.16'
  end
  devel do
    url 'https://releases.hashicorp.com/terraform/0.7.0-rc2/terraform_0.7.0-rc2_darwin_amd64.zip'
    sha256 'ade28697e57abd2b8a5dd35144bfbef946e2503362c3613340cff8ff7a99365b'
    version '0.7.0-rc2'
  end
  def install
    bin.install Dir['*']
  end
end
