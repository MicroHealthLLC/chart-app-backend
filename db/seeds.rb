# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.create(title: "Public Channel 1", description: "This channel shows public reports for everyone to see.", category: "public")

Channel.create(title: "Group Channel 1", description: "This channel shows group reports for members.", category: "group")

Channel.create(title: "My Reports", description: "This channel shows my reports.", category: "personal")

DataSet.create(title: "Data Set 1", description: "This is sample data.", data: [{Person: "Alex", "Tasks Completed": 5, "Issues Resolved": 3, "Risks Mitigated": 7}, {Person: "Daisy", "Tasks Completed": 1, "Issues Resolved": 4, "Risks Mitigated": 3}, {Person: "Jimmy", "Tasks Completed": 0, "Issues Resolved": 6, "Risks Mitigated": 3}])