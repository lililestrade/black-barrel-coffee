# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying database..."

Mutation.destroy_all
Month.destroy_all

puts "Creatings mutations ..."

natural_mutation = Mutation.create(name: "Naturally occurring genetic mutation.")
hybrid_one = Mutation.create(name: "Hybrid mutation naturally occurring.")
hybrid_two = Mutation.create(name: "Hybrid mutation selective breeding.")

puts "Creatings months ..."

Month.create(name: "Janvier")
Month.create(name: "Février")
Month.create(name: "Mars")
Month.create(name: "Avril")
Month.create(name: "Mai")
Month.create(name: "Juin")
Month.create(name: "Juillet")
Month.create(name: "Aout")
Month.create(name: "Septembre")
Month.create(name: "Octobre")
Month.create(name: "Novembre")
Month.create(name: "Décembre")

puts 'Finish !'
