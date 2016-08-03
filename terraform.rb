class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_darwin_amd64.zip'
  sha256 '4720e4b2878b3b0d3d781f68ff363707ed42fe39cb89e2e34c6c11f8e0f76b04'
  version '0.7.0'
  def install
    bin.install Dir['*']
  end
end
