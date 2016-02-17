require 'active_support/inflector'
require 'erb'
require 'net/http'
require 'nokogiri'

def version(name)
  index_url = Net::HTTP.get(URI("https://releases.hashicorp.com/#{name}/"))
  index = Nokogiri::HTML(index_url)
  slug = index.xpath('//html/body/ul/li')[1].children[1].attributes['href'].to_s
  slug.split('/')[2]
end

def sha256sum(name)
  version = version(name)
  sha256sums_url = format(
    'https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS',
    name,
    version,
    name,
    version
  )
  sha256sums = Net::HTTP.get(URI(sha256sums_url)).split("\n")
  sha256sums.find { |x| /darwin_amd64/.match(x) }.split('  ')[0]
end

def formula(name, homepage)
  puts "Generating #{name}.rb"

  @name = name
  @homepage = homepage
  @version = version(name)
  @sha256sum = sha256sum(name)

  template = File.open('template.erb').read
  File.open("#{name}.rb", 'w') do |f|
    f.puts ERB.new(template).result
  end
end

task :consul do
  formula('consul', 'https://www.consul.io')
end

task :envconsul do
  formula('envconsul', 'https://github.com/hashicorp/envconsul')
end

task :consul_template do
  formula('consul-template', 'https://github.com/hashicorp/consul-template')
end

task :nomad do
  formula('nomad', 'https://www.nomadproject.io')
end

task :otto do
  formula('otto', 'https://www.ottoproject.io')
end

task :packer do
  formula('packer', 'https://www.packer.io')
end

task :serf do
  formula('serf', 'https://www.serfdom.io')
end

task :terraform do
  formula('terraform', 'https://www.terraform.io')
end

task :vault do
  formula('vault', 'https://www.vaultproject.io')
end

task :default => [
  :consul,
  :consul_template,
  :envconsul,
  :nomad,
  :otto,
  :packer,
  :serf,
  :terraform,
  :vault
]
