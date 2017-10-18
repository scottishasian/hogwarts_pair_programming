require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

house1 = House.new(
  {
    'house_name' => "Gryffindor",
    'house_logo' => "https://i.pinimg.com/736x/b7/71/51/b77151ec8ecf2bbcbfe704151ab3a0ab--logo-design-house-hotel-logo-design.jpg",
  }
)

house2 = House.new(
  {
    'house_name' => "Hufflepuff",
    'house_logo' => "https://i.pinimg.com/736x/31/18/ac/3118ac5750ee55f0b31ba571e551708e--house-trees-a-house.jpg",
  }
)
house3 = House.new(
  {
    'house_name' => "Ravenclaw",
    'house_logo' => "https://i.pinimg.com/736x/31/18/ac/3118ac5750ee55f0b31ba571e551708e--house-trees-a-house.jpg",
  }
)
house4 = House.new(
  {
    'house_name' => "Slytherin",
    'house_logo' => "https://i.pinimg.com/736x/b7/71/51/b77151ec8ecf2bbcbfe704151ab3a0ab--logo-design-house-hotel-logo-design.jpg",
  }
)

house1.save()
house2.save()
house3.save()
house4.save()

student1 =  Student.new(
  {
    'first_name' => 'Keith',
    'last_name' => 'Keithson',
    'house_id' => house1.id,
    'age' => '45'
  }
)

student2 =  Student.new(
  {
    'first_name' => 'Audrey',
    'last_name' => 'Audreyson',
    'house_id' => house2.id,
    'age' => '63'
  }
)

student1.save()
student2.save()



binding.pry
nil
