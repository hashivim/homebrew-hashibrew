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
    url 'https://releases.hashicorp.com/terraform/0.7.0-rc1/terraform_0.7.0-rc1_darwin_amd64.zip'
    sha256 '04cb5d3fdb500ac83a2002006b4331a9e5db92c22b8b4971731c66a9fb8906ee'
    version '0.7.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
