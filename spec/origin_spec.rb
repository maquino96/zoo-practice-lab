require "spec_helper"

describe "Origin" do

  describe "#new" do
    it "initializes with a continent and country" do
      expect{origin = Origin.new("Europe","France")}.to_not raise_error
    end
  end

  describe "#country" do
    it "returns the country for this origin instance" do
        air = Origin.new("Asia","Southern Air Temple")
        expect(air.country).to eq("Southern Air Temple")
    end
  end

  describe "#continent" do
    it "returns the continent for this origin instance" do
        earth = Origin.new("North America", "Earth Kingdom")
        expect(earth.continent).to eq("North America")
    end
  end

   describe "#animals" do
    it "returns all the animals that this instance of an origin has" do
        air = Origin.new("Asia","Southern Air Temple")
        appa = Animal.new("Sky Bison", "Appa")
        momo = Animal.new("Flying Lemur","Momo")
        oogi = Animal.new("Sky Bison","Oogi")
        appa.origin = air
        momo.origin = air
        oogi.origin = air
        expect(air.animals).to include(appa)
        expect(air.animals).to include(momo)
        expect(air.animals).to include(oogi)
    end
    it "returns all the animals that this instance of an origin has" do
        fire = Origin.new("Asia", "Fire Nation")
        fang = Animal.new("Dragon","Fang")
        fang.origin = fire
        expect(fire.animals).to eq([fang])
    end
   end

    describe "#zoos" do
        it "returns all the zoos that hold animals of this origin" do
            earth = Origin.new("North America", "Earth Kingdom")
            ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
            bosco = Animal.new("Just a Bear", "Bosco")
            nyla = Animal.new("Shirshu", "Nyla")
            bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
            bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
            ffcp.origin = earth
            bosco.origin = earth
            nyla.origin = earth
            ffcp.zoo = bss
            bosco.zoo = bronx
            nyla.zoo = bronx
            expect(earth.zoos).to include(bss)
            expect(earth.zoos).to include(bronx)
        end
        it "returns all the zoos that hold animals of this origin" do
            air = Origin.new("Asia","Southern Air Temple")
            appa = Animal.new("Sky Bison", "Appa")
            momo = Animal.new("Flying Lemur","Momo")
            oogi = Animal.new("Sky Bison","Oogi")
            appa.origin = air
            momo.origin = air
            oogi.origin = air
            appa.zoo = bss
            momo.zoo = bss  
            oogi.zoo = bss
            expect(air.zoos).to eq([bss])
        end
    end

    describe "#animal_number" do
            it "returns an integer that indicates the number of different animal instances this origin has in total" do
                fire = Origin.new("Asia", "Fire Nation")
                fang = Animal.new("Dragon","Fang")
                fang.origin = fire
                expect(fire.animal_number).to eq(1)
            end
            it "returns an integer that indicates the number of different animal instances this origin has in total" do
                earth = Origin.new("North America", "Earth Kingdom")
                ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
                bosco = Animal.new("Just a Bear", "Bosco")
                nyla = Animal.new("Shirshu", "Nyla")
                ffcp.origin = earth
                bosco.origin = earth
                nyla.origin = earth
                expect(earth.animal_number).to eq(3)
            end
    end

    describe ".all" do
        it "returns an array of all the origin instances" do
            air = Origin.new("Asia","Southern Air Temple")
            earth = Origin.new("North America", "Earth Kingdom")
            fire = Origin.new("Asia", "Fire Nation")
            expect(Origin.all).to include(fire)
            expect(Origin.all).to include(air)
            expect(Origin.all).to include(earth)
        end
    end

    describe ".find_by_continent" do
        it "takes in a string of a continent as an argument and returns an array of all the countries within that continent" do
            air = Origin.new("Asia","Southern Air Temple")
            earth = Origin.new("North America", "Earth Kingdom")
            fire = Origin.new("Asia", "Fire Nation")
            expect(Origin.find_by_continent("Asia")).to include("Southern Air Temple")
            expect(Origin.find_by_continent("Asia")).to include("Fire Nation")
        end
    end

    describe ".most_animals" do
        it "return an instance of an origin that in general has the most animals" do
            air = Origin.new("Asia","Southern Air Temple")
            earth = Origin.new("North America", "Earth Kingdom")
            fire = Origin.new("Asia", "Fire Nation")
            appa = Animal.new("Sky Bison", "Appa")
            ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
            momo = Animal.new("Flying Lemur","Momo")
            fang = Animal.new("Dragon","Fang")
            bosco = Animal.new("Just a Bear", "Bosco")
            nyla = Animal.new("Shirshu", "Nyla")
            appa.origin = air
            ffcp.origin = earth
            momo.origin = air
            fang.origin = fire
            bosco.origin = earth
            nyla.origin = earth
            expect(Origin.most_animals).to eq(earth)
        end
    end
    

end

# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line