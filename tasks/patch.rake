desc 'Patch gems to fix known issues'
task :patch do
  Dir['patches/*.patch'].each do |patch|
    gem = patch.sub('.patch', '').sub(%r{^patches/}, '')
    path = `gem which #{gem}`.chomp.sub(%r</lib/.*>, '')
    puts "# Patching #{path}"
    sh "gem pristine #{gem} > /dev/null"
    sh "patch --directory=#{path} --backup --batch --strip=1 < #{File.expand_path(patch)}"
  end
end
