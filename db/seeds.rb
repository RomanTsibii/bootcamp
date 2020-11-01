require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department =  Department.create( title: Faker::Company.name )
p "Department created"

trainee = 1.times { User.create( first_name: "trainee",  last_name: Faker::Name.last_name ,  email: Faker::Internet.unique.email , password: "123456789" , department: department, level: 0 ) }
junior = 1.times { User.create( first_name: "junior",  last_name: Faker::Name.last_name ,  email: Faker::Internet.unique.email , password: "123456789" , department: department, level: 1 ) }
middle = 1.times { User.create( first_name: "middle" ,  last_name: Faker::Name.last_name ,  email: Faker::Internet.unique.email , password: "123456789" , department: department, level: 5 ) }
senior = 1.times { User.create( first_name: 'senior' ,  last_name: Faker::Name.last_name ,  email: Faker::Internet.unique.email , password: "123456789" , department: department, level: 10 ) }
p "users created"

admin = 1.times { User.create( first_name: Faker::Name.first_name ,  last_name: Faker::Name.last_name ,  email: "romanot70@gmail.com" , password: "123456789" , department: department, role: 100 ) }
p "admin created"

dp =  DevelopmentPlan.create( title: Faker::Company.type, department: department )
p "DevelopmentPlan created"

fs1 = FlowStep.create( title: "pending",development_plan: dp )
fs2 = FlowStep.create( title: "in_porgress",development_plan: dp )
fs3 = FlowStep.create( title: "Done",development_plan: dp )
p "FlowStep created"

tasks_trainee = rand(2..5).times { Task.create( title: Faker::Job.title, level: 0, flow_step: fs1,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256)) }
tasks_trainee = rand(2..5).times { Task.create( title: Faker::Job.title, level: 0, flow_step: fs2,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_trainee = rand(2..5).times { Task.create( title: Faker::Job.title, level: 0, flow_step: fs3,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
p "tasks_trainee created"

tasks_junior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 1, flow_step: fs1,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_junior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 1, flow_step: fs2,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_junior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 1, flow_step: fs3,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
p "tasks_junior created"

tasks_middle = rand(2..5).times { Task.create( title: Faker::Job.title, level: 5, flow_step: fs1,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_middle = rand(2..5).times { Task.create( title: Faker::Job.title, level: 5, flow_step: fs2,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_middle = rand(2..5).times { Task.create( title: Faker::Job.title, level: 5, flow_step: fs3,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
p "tasks_middle created"

tasks_senior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 10, flow_step: fs1,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_senior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 10, flow_step: fs2,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
tasks_senior = rand(2..5).times { Task.create( title: Faker::Job.title, level: 10, flow_step: fs3,development_plan: dp, description: Faker::Lorem.paragraph_by_chars(number: 256) ) }
p "tasks_senior created"
