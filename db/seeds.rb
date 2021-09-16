# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.find_or_create_by(email: "admin@example.com") do |user|
  user.email = "admin@example.com"
  user.first_name = "Admin"
  user.last_name = "User"
  user.password = "password"  
end

Tag.create(title: "Daily")
Tag.create(title: "Weekly")
Tag.create(title: "Monthly")
Tag.create(title: "Yearly")
Tag.create(title: "Finance")
Tag.create(title: "Performance")
Tag.create(title: "Costs")
Tag.create(title: "Daily")
Tag.create(title: "Employee")
Tag.create(title: "Management")

Channel.create(
  user_id: 1,
  title: "Public Channel 1",
  description: "This channel shows public reports for everyone to see.",
  category: "public"
)

Channel.create(
  user_id: 1,
  title: "Group Channel 1",
  description: "This channel shows group reports for members.",
  category: "group"
)

Channel.create(
  user_id: 1,
  title: "My Reports",
  description: "This channel shows my reports.",
  category: "personal"
)

DataSet.create(
  user_id: 1,
  title: "2020 Team Progress",
  description: "Tasks, Isssues, and Risks completed by team in 2020.", 
  data: [
    {
     Quarter: "Quarter 1",
     "Tasks Completed": 1,
     "Issues Resolved": 2,
     "Risks Mitigated": 1,
     "Lessons Learned": 0,
    }, 
    {
      Quarter: "Quarter 2",
      "Tasks Completed": 3,
      "Issues Resolved": 4,
      "Risks Mitigated": 4,
      "Lessons Learned": 2,
    }, 
    {
      Quarter: "Quarter 3",
      "Tasks Completed": 1,
      "Issues Resolved": 2,
      "Risks Mitigated": 3,
      "Lessons Learned": 1,
    },
    {
      Quarter: "Quarter 4",
      "Tasks Completed": 8,
      "Issues Resolved": 7,
      "Risks Mitigated": 6,
      "Lessons Learned": 5,
    }
  ]
)

DataSet.create(
  user_id: 1,
  title: "2020 Team Totals",
  description: "Total Tasks, Isssues, and Risks completed by team in 2020.", 
  data: [
    {
      Item: "Tasks",
      "Total": 13
    },
    {
      Item: "Issues",
      "Total": 15
    },
    {
      Item: "Risks",
      "Total": 14
    },
    {
      Item: "Lessons",
      "Total": 8
    }
  ]
)

DataSet.create(
  user_id: 1,
  title: "2020 Team Member Totals",
  description: "Total Tasks, Isssues, Risks, and Lessons completed by team member in 2020.", 
  data: [
    {
      Person: "John Doe",
      "Tasks Completed": 3,
      "Issues Resolved": 1,
      "Risks Mitigated": 2,
      "Lessons Learned": 0,
    },
    {
      Person: "Jane Doe",
      "Tasks Completed": 1,
      "Issues Resolved": 1,
      "Risks Mitigated": 5,
      "Lessons Learned": 1,
    },
    {
      Person: "Sally Doe",
      "Tasks Completed": 7,
      "Issues Resolved": 10,
      "Risks Mitigated": 4,
      "Lessons Learned": 2,
    },
    {
      Person: "James Doe",
      "Tasks Completed": 2,
      "Issues Resolved": 3,
      "Risks Mitigated": 3,
      "Lessons Learned": 5,
    }
  ]
)

Report.create(
  user_id: 1,
  title: "2020 Team Progress",
  description: "Tasks, Isssues, Risks, and Lessons completed by team in 2020.", 
  data_set_id: 1,
  chart_type: "area",
  channel_id: 1,
  tag_ids: [4, 6],
  color_scheme_id: 1,
  last_updated_by: "Admin User"
)

Report.create(
  user_id: 1,
  title: "2020 Totals",
  description: "2020 Totals for Tasks, Issues, Risks, and Lessons",
  data_set_id: 2,
  chart_type: "bar",
  channel_id: 1,
  tag_ids: [4, 6],
  color_scheme_id: 1,
  last_updated_by: "Admin User"
)

Report.create(
  user_id: 1,
  title: "2020 Team Member Totals",
  description: "Total Tasks, Isssues, Risks, and Lessons completed by team member in 2020.", 
  data_set_id: 3,
  chart_type: "pie",
  channel_id: 1,
  tag_ids: [4, 6],
  color_scheme_id: 3,
  last_updated_by: "Admin User"
)

Dashboard.create(
  user_id: 1,
  title: "2020 Progress",
  description: "2020 Progress for Tasks, Issues, Risks, and Lessons Learned.",
  channel_id: 1,
  layout: "layout-1",
  report_ids: [1, 2, 3],
  tag_ids: [4, 6],
  last_updated_by: "Admin User"
)

News.create(
  user_id: 1,
  title: "Welcome!",
  body: "Welcome to mRMS."
)