class Origin
    attr_accessor :continent, :country
    @@all = []

    def initialize(continent, country)
        @continent = continent
        @country = country
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end
    
    def animals
        Animal.all.select{ |animal| animal.origin == self }
    end    

    def zoos
        self.animals.map{|animal| animal.zoo}.uniq
    end    

    def animal_number
        animals.length
    end   
    
    def self.find_by_continent(continent_string)
        countries = []
        Origin.all.each do |origin|
            if origin.continent == continent_string
                countries.push(origin.country)
            end

        end
        countries
    end    

    def self.most_animals
        origin_numbers = self.all.map{|origin| origin.animal_number}
        self.all.find{|origin| origin.animal_number == origin_numbers.max}
    end    

end