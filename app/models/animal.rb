class Animal

    #The species and origin of the animal should not change.
    #The name and zoo of the animal should be able to change.
    #Instructions say we need to be able to create an array with all of the instances
    attr_reader :species, :origin
    attr_accessor :zoo, :name
    @@all = []

    #Needs to be instantiated with species and name
    #When calling the species you should also get their zoo and origin
    def initialize(species, name)
        @species = species
        @zoo = zoo
        @origin = origin
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

end
