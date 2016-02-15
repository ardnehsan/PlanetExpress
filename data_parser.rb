
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

  end

end



fry_money = fry.map {|destination| destination["Money"].to_i}.reduce(:+)
fry << fry_money


amy_money = amy.map {|destination| destination["Money"].to_i}.reduce(:+)


bender_money = bender.map {|destination| destination["Money"].to_i}.reduce(:+)

leela_money = leela.map {|destination| destination["Money"].to_i}.reduce(:+)


total_money = fry_money + amy_money + bender_money + leela_money
  p total_money

puts


  frybon = fry_money * 0.1


  amybon = amy_money * 0.1


  benbon = bender_money * 0.1


  leebon = leela_money * 0.1



html = File.read("report.erb")
# replace values
compiled_html = ERB.new(html).result(binding)

#writes to HTMl
File.open("./index-output.html", "wb") do |file|
    file.write(compiled_html)
    file.close()
  end
