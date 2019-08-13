# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Warrior.destroy_all
User.destroy_all

30.times do
  User.create(first_name:Faker::Movies::LordOfTheRings.character, last_name:Faker::Movies::LordOfTheRings.character,email:Faker::Internet.email,password: 'jaures')
end

photos = ['https://hallofbeorn.files.wordpress.com/2016/11/eowyn-by-magali-villeneuve.jpg','https://i.pinimg.com/originals/e2/fc/c5/e2fcc573224ffef8fe555246cf7d6975.jpg','http://2.bp.blogspot.com/-V3Izi6ZbkvA/TvOmwH_Wd8I/AAAAAAAAAZU/O8ztphZt3F8/s1600/Bifur-Magali+Villeneuve+b.jpg', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a56def2b-dcb5-4213-98ad-7e9c327e22f7/d4wikm1-cd707187-9cc0-4dfc-9723-4ee91170b069.jpg/v1/fill/w_600,h_600,q_75,strp/lord_of_the_rings__tcg___strider_by_anthonyfoti_d4wikm1-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjAwIiwicGF0aCI6IlwvZlwvYTU2ZGVmMmItZGNiNS00MjEzLTk4YWQtN2U5YzMyN2UyMmY3XC9kNHdpa20xLWNkNzA3MTg3LTljYzAtNGRmYy05NzIzLTRlZTkxMTcwYjA2OS5qcGciLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.bO-LXyo7RDZH4H1_1ApBv9ZPzTt2zhchdWYDN2yFYMs', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a56def2b-dcb5-4213-98ad-7e9c327e22f7/d64fn6k-d2bee698-1413-4d2e-a1af-30108184441b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E1NmRlZjJiLWRjYjUtNDIxMy05OGFkLTdlOWMzMjdlMjJmN1wvZDY0Zm42ay1kMmJlZTY5OC0xNDEzLTRkMmUtYTFhZi0zMDEwODE4NDQ0MWIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9HOgz7Z6VATfE_vceyl3U84TxQFdMuvA65YsOJfzY_M', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a56def2b-dcb5-4213-98ad-7e9c327e22f7/d39ou8t-787b8948-50e5-4833-a381-69f3497b833a.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E1NmRlZjJiLWRjYjUtNDIxMy05OGFkLTdlOWMzMjdlMjJmN1wvZDM5b3U4dC03ODdiODk0OC01MGU1LTQ4MzMtYTM4MS02OWYzNDk3YjgzM2EuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ttok7J0kXA3MzqfR1fO9mWVC2K3-JBqc1sCWHWfzbOA']
specialties = ["Foot soldier", "Berserker", "Thief", "Maiar", "Cavalry", "Archery", "Spy"]
races = ["Elf", "Hobbit", "Dwarf", "Orc", "Human","Ent", "Uruk-hai", "Nazgul"]
weapons = ["Bow", "Sword", "Axe", "Hammer", "Teeth", "Bare hands", "Magic"]

5.times do
  warrior = Warrior.new(
    nickname: Faker::Movies::LordOfTheRings.unique.character,
    race: races.sample,
    specialty: specialties.sample,
    user: User.all.sample,
    address: Faker::Address.full_address,
    weapon: weapons.sample,
    price: rand(50..300)
  )
  warrior.remote_photo_url = photos.sample
  warrior.save!
end
