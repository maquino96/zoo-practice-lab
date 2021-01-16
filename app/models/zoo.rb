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

    def all_animals
        Animal.all.select{|animal| animal.zoo ==self}
    end

    def all_animal_species
        self.all_animals.map(&:species).uniq
    end 

    def origins
        self.all_animals.map(&:origin).uniq
        #Animal.all.select{|el| el.origin}.uniq
    end 

    def self.find_by_name(zoo_name)
        self.all.find{|el| el.name == zoo_name }
    end 


end