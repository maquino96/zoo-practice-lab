class Animal
   #The species and origin of the animal should not change.
    #The name and zoo of the animal should be able to change.
    #Instructions say we need to be able to create an array with all of the instances
    attr_reader :species
    attr_accessor :zoo, :name, :origin
    @@all = []

    #Needs to be instantiated with species and name
    #When calling the species you should also get their zoo and origin
    def initialize(species, name)
        @species = species
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end
 
end
