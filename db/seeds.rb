file = File.join(Rails.root, 'db', 'places.csv')

CSV.foreach(file) do |row|
  Place.create(id: row[0], name: row[1], kind: row[2], address: row [3], city: row[4], country: row[5], difficulty: row[6], description: row[7])
end
