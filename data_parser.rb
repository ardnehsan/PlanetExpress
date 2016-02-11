require 'csv'
require 'erb'


CSV.foreach("planet_express_logs.csv", headers: true) do |row|
    logs << row.to_hash
end

print Destination
Earth = []
Mars = []
Uranos = []
Every = []

# logs.each do |log|
#   if logs["Earth"] == "Fry"
#   elsif logs["Planet"] == "Amy"
#   elsif logs["Planet"] == "Bender"
#   elsif logs["Planet"] == "Leela"


html_string = File.read("report.erb")
compiled_html = ERB.new(html_string).result(binding)
File.open("./index-output.html", "wb") {|file|
    file.write(compiled_html)
    file.close()
}


#HOW MUCH MONEY WAS MADE THIS WEEK
#HOW MUCH DID EACH EMPLOYEE GET AS A BONUS
#HOW MANY TRIPS DID EACH EMPLOYEE PILOT

# FRY - EARTH
# AMY - MARS
# BENDER - URANOS
# LEELA - EVERYWHERE

# BONUS EQUALS 10% OF THE MONEY FROM TRIPS

# We need sections on the HTML with:
#
# h1 with the total money we made this week
# List of all Shipments (create a table with the shipments listed)
# List of all employees and their number of trips and bonus
# Pie chart of the Money each employee delivered
# A gif, preferably related to Fry, Amy, Bender, and/or Leela
