require 'active_support/inflector'
require 'erb'
require 'net/http'
require 'nokogiri'

class ExceptioLatine < Exception; end

def version_string(nokogiri_element)
  nokogiri_element.children[1].attributes['href'].to_s.split('/')[2]
end

def version(name)
  index_url = Net::HTTP.get(URI("https://releases.hashicorp.com/#{name}/"))
  index = Nokogiri::HTML(index_url)
  li = index.xpath('//html/body/ul/li').reject do |x|
    /\-rc/.match(version_string(x))
  end
  version_string(li[1])
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
  @name = name
  @homepage = homepage
  @version = version(name)
  @sha256sum = sha256sum(name)

  template = File.open('template.erb').read
  File.open("#{name}.rb", 'w') do |f|
    f.puts ERB.new(template).result
  end
end

task :commit do
  git_status = `git status`.split("\n")
  modified = git_status.select { |s| /modified:.*rb$/.match(s) }
  formulas = modified.collect { |m| m.split('   ')[1].gsub(/\.rb$/, '') }
  formulas.each do |formula|
    formula_file = File.open("#{formula}.rb").readlines
    version_line = formula_file.select { |l| /^  version/.match(l) }[0]
    version = version_line.split("'")[1]
    system "git commit #{formula}.rb -m '#{formula} #{version}'"
  end
end

task :atlas_upload_cli do
  formula('atlas-upload-cli', 'https://github.com/hashicorp/atlas-upload-cli')
end

task :consul do
  formula('consul', 'https://www.consul.io')
end

task :envconsul do
  formula('envconsul', 'https://github.com/hashicorp/envconsul')
end

task :consul_replicate do
  formula('consul-replicate', 'https://github.com/hashicorp/consul-replicate')
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

task :formulas => [
  :atlas_upload_cli,
  :consul,
  :consul_replicate,
  :consul_template,
  :envconsul,
  :nomad,
  :otto,
  :packer,
  :serf,
  :terraform,
  :vault
]

task :formulae do
  raise ExceptioLatine, '`rake formulas` is the preferred nomenclature'
end

task :default => [
  :formulas,
  :commit
]
