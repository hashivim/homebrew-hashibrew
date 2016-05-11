class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  version '0.6.16'

  url 'https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_darwin_amd64.zip'
  sha256 '23feb79263126877e6128a03c600cd626f6691a118a474694c5ad45cc5da9366'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
