class Zoo
    
    @@all = []

    attr_accessor :name
    attr_reader :address

    def initialize(name, address)
        @name = name
        @address = address
        self.class.all << self
    end 

    def self.all
        @@all
    end 

    def self.clear
        @@all = []
    end

    def all_animals
        Animal.all.select{|animal| animal.zoo ==self}
    end

    def all_animal_species
        all_animals.map(&:species).uniq
    end 

    def origins
        all_animals.map(&:origin).uniq
    end 

    def self.find_by_name(zoo_name)
        self.all.find{|zoo| zoo.name == zoo_name }
    end 

end