require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize (name, species = 'human')
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    self.all.collect{|owner| owner.name}.count
  end

  def self.reset_all
    self.all.clear
  end
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(new_pet)
    self.cats << Cat.new(new_pet, self)
  end 

  def buy_dog(new_pet)
    self.dogs << Dog.new(new_pet, self)
  end 

  def walk_dogs
    Dog.all.each{|dog| dog.mood  = "happy"}
  end 

  def feed_cats
    Cat.all.each{|cat| cat.mood  = "happy"}
  end

  def sell_pets
    Dog.all.each{|dog| dog.mood  = "nervous"}
    Cat.all.each{|cat| cat.mood  = "nervous"}
    Dog.all.each{|dog| dog.owner  = nil}
    Cat.all.each{|cat| cat.owner  = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end