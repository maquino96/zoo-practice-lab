class Zoo
    
    @@all = []

    attr_accessor :name
    attr_reader :address

    def initialize(name, address)
        @name = name
        @address = address
    end 

    def self.all
        @@all
    end 

    def all_animals
        
    end


    def all_animal_species
        Animal.all.map(&:species).uniq
    end 

    def origins
        Animal.all.select{|el| el.origin}.uniq
    end 

    def self.find_by_name(zoo_name)
        self.all.select{|el| el.name == zoo_name }
    end 


end