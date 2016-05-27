require 'csv'

require 'csv'
#PoliticalParty.destroy_all
County.destroy_all
#Constituency.destroy_all
Politician.destroy_all
#Contest.destroy_all

=begin
CSV.foreach("#{Rails.root}/lib/data/parties.csv") do |row|
  p row
  PoliticalParty.create!(:id=>row[0],:name => row[1], :symbol => row[3],:abr => row[2],:code=>row[4])
end
=end

CSV.foreach("#{Rails.root}/lib/data/county.csv") do |row|
  p row
  County.create!(:id => row[0], :name => row[1])
end

=begin
CSV.foreach("#{Rails.root}/lib/data/constituency.csv") do |row|
  p row
  Constituency.create!(:id=>row[0],:name => row[1], :county_id =>row[2])
end
=end

CSV.foreach("#{Rails.root}/lib/data/politician.csv") do |row|
  p row
  Politician.create!(id:row[0],full_name:row[1], contest_type:row[2],party_id:row[3],contest_id:row[4], primary_secondary_school:row[5], undergraduate_school:row[6], graduate_school:row[7],previous_position:row[8])
end


CSV.foreach("#{Rails.root}/lib/data/contest.csv") do |row|
  p row
  Contest.create!( :id=>row[0],name: row[1], contestType: row[2])
end
