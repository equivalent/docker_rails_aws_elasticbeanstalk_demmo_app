# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# image urls were googled under "Labeled for noncommercial reuse" filter
Puppy.create(name: "Cute Golden Retriever Puppies", url: "https://c1.staticflickr.com/5/4046/4215831807_5c59dd85af.jpg")
Puppy.create(name: "Adorable Toy Poodle", url: "https://c2.staticflickr.com/4/3189/2913168941_1272db8f53_z.jpg?zz=1")
Puppy.create(name: "Fluffy Alaskan Malamute ", url: "https://c1.staticflickr.com/1/22/146828640_463b12e9af_z.jpg?zz=1")

puts "done"
