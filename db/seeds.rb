# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fabien = User.create! username: 'fabien', password: 'test123', password_confirmation: 'test123'
team = Team.create! name: 'Team test', owner: fabien
league = League.create! name: 'League beta'
