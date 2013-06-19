# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Carregando Estados
#p 'Carregando estados...'
#File.readlines('./db/data/estados.csv').each do |line|
#  sigla, name = line.strip.split(';')
#  State.create(:sigla => "#{sigla}", :name => "#{name}")
#end

# Carregando Cidades
#p 'Carregando cidades...'
#File.readlines('./db/data/cidades.csv').each do |line|
#  name, state_id = line.strip.split(';')
#  City.create(:name => "#{name}", :state_id => "#{state_id}")
#end

# Carregando Cidades e Estados em Ce [Cidade e Estado]
p 'Carregando autocomplete de cidades e estados...'
cities = City.all
cities.each do |city|
  Ce.create(:city => "#{city.name} | #{city.state.sigla}", :uf => "#{city.state.sigla}")
end