DOCUMENTS = %W( 
  freistilbox_datenschutzvereinbarung.pdf
  fbdv_anlage_1.pdf
  fbdv_anlage_2.pdf)

CSSFILE="freistilbox.css"

task :default => :pdf
task :pdf => DOCUMENTS

rule ".pdf" => ".html" do |t|
  sh "prince #{t.source} -o #{t.name}"
end

rule ".html" => [".md", CSSFILE] do |t|
  sh "multimarkdown #{t.source} > #{t.name}"
end
 
rule ".css" => ".scss" do |t|
  sh "sass #{t.source} > #{t.name}"
end

require 'rake/clean'
DOCUMENTS.map{ |f| f.ext('.html') }.each do |f|
  CLEAN.add(f) if File.exists?(f)
end
CLEAN.add(CSSFILE) if File.exists?(CSSFILE)
CLOBBER << DOCUMENTS
