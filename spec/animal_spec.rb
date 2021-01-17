require "spec_helper"

describe "Animal" do

  describe "#new" do
    it "initializes with a species and name" do
      appa = Animal.new("Sky Bison", "Appa")
      expect(appa.species).to eq("Sky Bison")
      expect(appa.name).to eq("Appa")
    end
  end

  describe "#zoo" do
    it "returns the zoo instance that this animal can be found in" do
        Origin.clear
        Animal.clear
        Zoo.clear
        appa = Animal.new("Sky Bison", "Appa")
        bss = Zoo.new("The Ba Sing Se Zoo", "Ba Sing Se, Earth Kingdom")
        appa.zoo = bss
        expect(appa.zoo).to eq(bss)
    end
    it "returns the zoo instance that this animal can be found in" do
        Origin.clear
        Animal.clear
        Zoo.clear
        bosco = Animal.new("Just a Bear", "Bosco")
        bronx = Zoo.new("The Bronx Zoo","Bronx, NY, USA, Real Life")
        bosco.zoo = bronx
        expect(bosco.zoo).to eq(bronx)
    end
  end

  describe "#origin" do
    it "returns the origin instance that this animal can be found in" do
        Origin.clear
        Animal.clear
        Zoo.clear
        fang = Animal.new("Dragon","Fang")
        fire = Origin.new("Asia", "Fire Nation")
        fang.origin = fire
        expect(fang.origin).to eq(fire)
    end
    it "returns the origin instance that this animal can be found in" do
        Origin.clear
        Animal.clear
        Zoo.clear
        momo = Animal.new("Flying Lemur","Momo")
        air = Origin.new("Asia","Southern Air Temple")
        momo.origin = air
        expect(momo.origin).to eq(air)
    end
  end

  describe "#species" do
    it "returns the species of this animal" do
        Origin.clear
        Animal.clear
        Zoo.clear
        ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
        expect(ffcp.species).to eq("Moose Lion")
    end
  end

  describe "#name" do
  it "returns the name of this animal" do
      Origin.clear
      Animal.clear
      Zoo.clear
      bosco = Animal.new("Just a Bear", "Bosco")
      expect(bosco.name).to eq("Bosco")
    end
  end

  describe ".all" do
  it "returns an array of all the animal instances" do
        Origin.clear
        Animal.clear
        Zoo.clear
        appa = Animal.new("Sky Bison", "Appa")
        ffcp = Animal.new("Moose Lion", "Foo Foo Cuddly Poops")
        momo = Animal.new("Flying Lemur","Momo")
        fang = Animal.new("Dragon","Fang")
        bosco = Animal.new("Just a Bear", "Bosco")
        nyla = Animal.new("Shirshu", "Nyla")
        oogi = Animal.new("Sky Bison","Oogi")
        expect(Animal.all).to include(appa)
        expect(Animal.all).to include(ffcp)
        expect(Animal.all).to include(momo)
        expect(Animal.all).to include(fang)
        expect(Animal.all).to include(bosco)
        expect(Animal.all).to include(nyla)
        expect(Animal.all).to include(oogi)
    end
  end



end




# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line