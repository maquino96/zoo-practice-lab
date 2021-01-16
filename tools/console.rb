require_relative '../config/environment.rb'
def reload
  load 'config/environment.rb'
end
####
#Saturday 12/16 12-2pm
#Sunday 12/17  1pm
#Monday 12/18  9am
###

###################
## Creating the objects and connecting them appropriately.
######
# 3 new origin objects
air = Origin.new("Asia","Southern Air Temple")
earth = Origin.new("North America", "Earth Kingdom")
fire = Origin.new("Asia", "Fire Nation")
# 6 new animal objects
appa = Animal.new("Sky Bison", "Appa")
ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
momo = Animal.new("Flying Lemur","Momo")
fang = Animal.new("Dragon","Fang")
bosco = Animal.new("Just a Bear", "Bosco")
nyla = Animal.new("Shirshu", "Nyla")
# 3 new zoo objects
bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
#assign origin to each animal
appa.origin = air
ffcp.origin = earth
momo.origin = air
fang.origin = fire
bosco.origin = earth
nyla.origin = earth
#assign zoos to animals
appa.zoo = bss
momo.zoo = bss    # aww Appa and Momo are together <3
ffcp.zoo = bss
bosco.zoo = bronx
nyla.zoo = bronx
fang.zoo = philly
########################

##########################
### Tests
###################
# Origin Tests (11)
origin_test_1 = air.country  # Should be "Southern Air Temple"
origin_test_2 = earth.continent  # Should be "North America"
origin_test_3 = Origin.all  # Should be [air object, earth object, fire object]
origin_test_4 = air.animals  #Should return [Appa object, Momo object]
origin_test_5 = fire.animals #Should return just [Fang object]
origin_test_6 = earth.zoos   #Should return [Ba Sing Se, Bronx Zoo]
origin_test_7 = air.zoos   #Should return [Ba Sing Se]
origin_test_8 = fire.animal_number  #Should return 1
origin_test_9 = earth.animal_number #Should return 3
origin_test_10 = Origin.find_by_continent("Asia") #Should return ["Southern Air Temple", "Fire Nation"]
origin_test_11 = Origin.most_animals #Should return the earth object
##################
#  Animal Tests (9)
animal_test_1 = appa.zoo  #Should return Ba Sing Se object
animal_test_2 = bosco.zoo #Should return Bronx Zoo object
animal_test_3 = fang.origin #Should return Fire Nation object
animal_test_4 = momo.origin #Should return Air Temple object
animal_test_5 = ffcp.species #Should return "Moose Lion"
animal_test_6 = nyla.species  #Should return "Shirshu"
animal_test_7 = bosco.name  #Should return "Bosco"
animal_test_8 = ffcp.name   #Should return "Foo Foo Cuddly Poops"
animal_test_9 = Animal.all #Should return all 6 animal objects in an array
##################
# Zoo Tests (11)
zoo_test_1 = bss.name #Should return "The Ba Sing Se Zoo"
zoo_test_2 = bronx.address #Should return "Bronx, NY, USA, Real Life"
zoo_test_3 = Zoo.all  #Should return [BSS object, Bronx object, Philly object]
zoo_test_4 = bronx.all_animals #Should return [Bosco object, Nyla object]
zoo_test_5 = philly.all_animals #Should return just [Fang object]
### needed one more animal of duplicate species v
oogi = Animal.new("Sky Bison","Oogi")
oogi.origin = air
oogi.zoo = bss
### needed one more animal of duplicate species ^
zoo_test_6 = bss.all_animal_species #Should return ["Sky Bison","Flying Lemur"]; should NOT have duplicate Sky Bison
zoo_test_7 = Zoo.find_by_name("The Ba Sing Se Zoo") #Should return the Ba Sing Se Zoo object
zoo_test_8 = Zoo.find_by_name("The Philadelphia Zoo") #Should return the Philly zoo object
zoo_test_9 = bronx.origins #Should return just [earth object]
zoo_test_10 = bss.origins #Should return [air object, earth object]
zoo_test_11 = philly.origins #Should return [fire object]
###################
## If all 11 tests return the expected values, we should be ** g o l d e n **
## We can just type the name of the test variable while in binding.pry to see if it matches as expected.
binding.pry
0