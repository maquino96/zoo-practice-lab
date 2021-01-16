require "spec_helper"

describe "Zoo" do

  describe "#new" do
    it "initializes with a name and address" do
        expect{bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")}.to_not raise_error
    end
    it "name can be changed" do
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        expect{bronx.name="Big Fun Zoo in the Bronx"}.to_not raise_error
    end
    it "address cannot be changed" do
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        expect{bronx.address="Los Angeles, CA"}.to raise_error(NoMethodError)
    end
  end

  describe "#name" do
    it "returns the name of this zoo instance" do
        bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
        expect(bss.name).to eq("The Ba Sing Se Zoo")
    end
  end

  describe "#address" do
    it "returns the address of this zoo instance" do
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        expect(bronx.address).to eq("Bronx, NY, USA, Real Life")
    end
  end

  describe "#all_animals" do
    it "returns an array of all the animals in this zoo" do
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        bosco = Animal.new("Just a Bear", "Bosco")
        nyla = Animal.new("Shirshu", "Nyla")
        bosco.zoo = bronx
        nyla.zoo = bronx
        expect(bronx.all_animals).to include(bosco)
        expect(bronx.all_animals).to include(nyla)
    end
    it "returns an array of all the animals in this zoo" do
        philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
        fang = Animal.new("Dragon","Fang")
        fang.zoo = philly
        expect(philly.all_animals).to include(fang)
    end
  end

  describe "#all_animal_species" do
    it "returns an array of the unique animal species in this zoo instance" do
        bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
        appa = Animal.new("Sky Bison", "Appa")
        momo = Animal.new("Flying Lemur","Momo")
        oogi = Animal.new("Sky Bison","Oogi")
        appa.zoo = bss
        momo.zoo = bss
        oogi.zoo = bss 
        expect(bss.all_animal_species).to include("Sky Bison")
        expect(bss.all_animal_species).to include("Flying Lemur")
        expect(bss.all_animal_species.length).to eq(2)
    end
  end

  describe "#origins" do
    it "returns an array of all the unique origins of animals in this zoo" do 
        air = Origin.new("Asia","Southern Air Temple")
        earth = Origin.new("North America", "Earth Kingdom")
        fire = Origin.new("Asia", "Fire Nation")
        bosco = Animal.new("Just a Bear", "Bosco")
        nyla = Animal.new("Shirshu", "Nyla")
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        bosco.origin = earth
        nyla.origin = earth
        bosco.zoo = bronx
        nyla.zoo = bronx
        expect(bronx.origins).to eq([earth])
    end
    it "returns an array of all the unique origins of animals in this zoo" do 
        air = Origin.new("Asia","Southern Air Temple")
        earth = Origin.new("North America", "Earth Kingdom")
        fire = Origin.new("Asia", "Fire Nation")
        appa = Animal.new("Sky Bison", "Appa")
        ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
        momo = Animal.new("Flying Lemur","Momo")
        bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
        appa.origin = air
        ffcp.origin = earth
        momo.origin = air
        appa.zoo = bss
        momo.zoo = bss  
        ffcp.zoo = bss
        expect(bss.origins).to include(air)
        expect(bss.origins).to include(earth)
        expect(bss.origins.length).to eq(2)
    end
    it "returns an array of all the unique origins of animals in this zoo" do 
        air = Origin.new("Asia","Southern Air Temple")
        earth = Origin.new("North America", "Earth Kingdom")
        fire = Origin.new("Asia", "Fire Nation")
        fang = Animal.new("Dragon","Fang")
        philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
        fang.origin = fire 
        fang.zoo = philly
        expect(philly.origins).to eq([fire])
    end
  end

  describe ".all" do
    it "returns an array of all the zoo instances" do
        bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
        expect(Zoo.all).to include(bss)
        expect(Zoo.all).to include(bronx)
        expect(Zoo.all).to include(philly)
      end
    end

    describe ".find_by_name" do
        it "takes in a zoo name argument and returns the zoo instance" do 
            bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
            bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
            philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
            expect(Zoo.find_by_name("The Ba Sing Se Zoo")).to eq(bss)
        end
        it "takes in a zoo name argument and returns the zoo instance" do 
            bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
            bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
            philly = Zoo.new("The Philadelphia Zoo", "Philadelphia, PA, USA, Real Life")
            expect(Zoo.find_by_name("The Philadelphia Zoo")).to eq(philly)
        end
    end

end




# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line