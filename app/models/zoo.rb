class Zoo
    
    @@all = []

    attr_accessor :name
    attr_reader :address

    def intiialize (name, address)
        @name = name
        @address = address
    end 

    def self.all
        @@all
    end 

    def all_animal_species
        Animals.all.map(&:species).uniq
    end 

    def zoo_origins
        Animals.all.select{|el| el.origin}.uniq
    end 

    def self.find_by_name(zoo_name)
        self.class.all.select{|el| el.name == zoo_name }
    end 


end