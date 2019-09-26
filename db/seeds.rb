# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying old seeds"
Ingredient.destroy_all
Cocktail.destroy_all
# require 'JSON'
require 'open-uri'
puts "start seeding"

puts "creating cocktails"

cocktail1 = Cocktail.create!(
  name: 'Bloody Mary',
  description: 'A Bloody Mary is a cocktail containing vodka, tomato juice, and combinations of other spices and flavorings including Worcestershire sauce, hot sauces, garlic, herbs, horseradish, celery, olives, salt, black pepper, lemon juice, lime juice and/or celery salt.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484425/mister-cocktail/bloody-mary-banner_tohcjk.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484459/mister-cocktail/bloody-mary_cjppps.jpg')
)

cocktail2 = Cocktail.create!(
  name: 'Screwdriver',
  description: 'A screwdriver is a popular alcoholic highball drink made with orange juice and vodka. While the basic drink is simply the two ingredients, there are many variations. Many of the variations have different names in different parts of the world.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484607/mister-cocktail/screwdriver_egxqru.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484531/mister-cocktail/screwdriver-112816_kftzcm.jpg')
)

cocktail3 = Cocktail.create!(
  name: 'Martini',
  description: 'The martini is a cocktail made with gin and vermouth, and garnished with an olive or a lemon twist. Over the years, the martini has become one of the best-known mixed alcoholic beverages. H. L. Mencken called the martini "the only American invention as perfect as the sonnet" and E. B.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569480657/mister-cocktail/vodka-martini-olives-glass_cmepel.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569480729/mister-cocktail/vodka-martini-recipe-720x720_xi3l4f.jpg')
)

cocktail4 = Cocktail.create!(
  name: 'Manhattan',
  description: 'A Manhattan is a cocktail made with whisky, sweet vermouth and bitters. While rye is the traditional whiskey of choice, other commonly used whiskies include Canadian whisky, bourbon, blended whiskey and Tennessee whiskey.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569481415/mister-cocktail/Manhattan-720x720-recipe_jq8hf7.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569480836/mister-cocktail/manhattan_tuijco.jpg')
)

cocktail5 = Cocktail.create!(
  name: 'Moscow Mule',
  description: 'A Moscow mule is a cocktail made with vodka, spicy ginger beer, and lime juice, garnished with a slice or wedge of lime. It is a type of buck and therefore sometimes known as a vodka buck. The Moscow mule is popularly served in a copper mug, which takes on the cold temperature of the liquid.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483479/mister-cocktail/IMG_5823-moscow-mule_pvvymv.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483493/mister-cocktail/IMG_6424_hwqs8a.jpg')
)

cocktail6 = Cocktail.create!(
  name: 'Margarita',
  description: 'A margarita is a cocktail consisting of tequila, orange liqueur, and lime juice often served with salt on the rim of the glass. The drink is served shaken with ice, blended with ice, or without ice.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483641/mister-cocktail/margarita-rocks-salt-720sq_bd5f6y.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483618/mister-cocktail/marg-h-1526063646_y5idzu.jpg')
)

cocktail7 = Cocktail.create!(
  name: 'Mojito',
  description: 'Mojito is a traditional Cuban highball. Traditionally, a mojito is a cocktail that consists of five ingredients: white rum, sugar, lime juice, soda water, and mint. Its combination of sweetness, citrus, and herbaceous mint flavors is intended to complement the rum, and has made the mojito a popular summer drink.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483813/mister-cocktail/mojitomain_sowehv.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569483834/mister-cocktail/Tequila-Mojito-2018-1-of-2-720x720_gsqxdf.jpg')
)

cocktail8 = Cocktail.create!(
  name: 'Negroni',
  description: 'The Negroni is a popular Italian cocktail, made of one part gin, one part vermouth rosso, and one part Campari, garnished with orange peel. It is considered an apéritif. A properly made Negroni is stirred, not shaken, and then strained into a chilled cocktail glass over ice.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484058/mister-cocktail/negroni-720x720-recipe_sa1gsa.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484090/mister-cocktail/negroni-1562327392_rcmuwv.jpg')
)

cocktail9 = Cocktail.create!(
  name: 'Cosmopolitan',
  description: 'A cosmopolitan, or informally a cosmo, is a cocktail made with vodka, triple sec, cranberry juice, and freshly squeezed or sweetened lime juice.',
  banner: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484752/mister-cocktail/222-low-fodmap-cosmopolitan_cfdauj.jpg'),
  photo: open('https://res.cloudinary.com/dxouryvao/image/upload/v1569484730/mister-cocktail/Cosmopolitan_km0yvv.jpg')
)

puts "creating ingredient list"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
ingredients_list = JSON.parse(json)
ingredients_list['drinks'].each do |ingredient_list|
  p ingredient_list["strIngredient1"]
  Ingredient.create!(name: ingredient_list["strIngredient1"])
end
