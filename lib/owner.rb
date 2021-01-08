class Owner
  attr_reader :name, :species 

  @@all = [] 

  def initialize(name)
    @name = name 
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    #returns a collection of all the cats 
    #that belong to the owner 
    #Cat.all = [<cat instance @name, @owner>,<cat instance @name, @owner>,<cat instance @name, @owner>]
    # |cat| => <cat instance @name, @owner>, cat.owner to get the cat's owner
    Cat.all.select { |cat| cat.owner == self }
  end 

  def dogs
    #returnsa a collection 
    #of all the dogs that belong to the owner
    Dog.all.select { |dog| dog.owner == self }
  end 

  def buy_cat(name)
    #can buy a cat that is an instance of the Cat class
    #An owner should be able to buy and sell a pet, which will 
    #   change the pet's mood.
    # Make a new instance of the appropriate pet, initializing 
    #    it with that name and the owner who is purchasing it.
    cat = Cat.new(name, self)     
  end

  def buy_dog(name)
    dog = Dog.new(name, self)     
  end

  def walk_dogs 
    self.dogs.map { |dog| dog.mood = "happy"}
  end 

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" } 
  end 


  def sell_pets 
    #sell_pets can sell all its pets, which makes them nervous
    # can sell all its pets, which leaves them without an owner 
    self.cats.each do |cat|
      cat.mood = "nervous" 
      cat.owner = nil 
    end

    self.dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil 
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end