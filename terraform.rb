class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.7/terraform_0.7.7_darwin_amd64.zip'
  sha256 'eb6255c4c14c61458ea4598a0e3176695c296e9f1650ad56a24a1cb75d8fef35'
  version '0.7.7'
  def install
    bin.install Dir['*']
  end
end
