require 'erb'
require 'csv'


logs = []

CSV.foreach("planet_express_logs.csv", headers: true) do |row|
    logs << row.to_hash
end

fry=[]
bender=[]
amy=[]
leela=[]

logs.each do |shipment|
  if shipment["Destination"] == "Earth"
    fry << shipment
  elsif shipment["Destination"] == "Mars"
    amy << shipment
  elsif shipment["Destination"] == "Uranus"
    bender << shipment
  else
    leela << shipment
    leelatrip = leela.count
  end

end

trips = []

  frytrip=fry.length
  trips << frytrip

  amytrip=amy.length
  trips << amytrip

  bendertrip=bender.length
  trips << bendertrip

  leelatrip=leela.length
  trips << leelatrip

pilot = []
pilot << 'Fry'
pilot << 'Amy'
pilot << 'Bender'
pilot << 'Leila'

puts

quantity = []
quantity = logs.map {|ship| ship["Shipment"]}
p quantity

puts

fry_money = fry.map {|destination| destination["Money"].to_i}.reduce(:+)
   p fry_money
puts

amy_money = amy.map {|destination| destination["Money"].to_i}.reduce(:+)
   p amy_money
puts

bender_money = bender.map {|destination| destination["Money"].to_i}.reduce(:+)
   p bender_money
puts

leela_money = leela.map {|destination| destination["Money"].to_i}.reduce(:+)
   p leela_money
puts

total_money = fry_money + amy_money + bender_money + leela_money
  p total_money

puts

bonus = []

  frybon = fry_money * 0.1
  bonus << frybon

  amybon = amy_money * 0.1
  bonus << amybon

  benbon = bender_money * 0.1
  bonus << benbon

  leebon = leela_money * 0.1
  bonus << leebon

p bonus

html = File.read("report.erb")
# replace values
compiled_html = ERB.new(html).result(binding)

#writes to HTMl
File.open("./index-output.html", "wb") do |file|
    file.write(compiled_html)
    file.close()
  end
