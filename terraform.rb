class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.10/terraform_0.7.10_darwin_amd64.zip'
  sha256 'e65095c09cd94d60f0a6bc470ad29b249051448533344722755cc617bdd277a4'
  version '0.7.10'
  def install
    bin.install Dir['*']
  end
end
