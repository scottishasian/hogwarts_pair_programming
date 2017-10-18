require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

student1 =  Student.new(
  {
    'first_name' => 'Keith',
    'last_name' => 'Keithson',
    'house' => 'Gryffindor',
    'age' => '45'
  }
)

student2 =  Student.new(
  {
    'first_name' => 'Audrey',
    'last_name' => 'Audreyson',
    'house' => 'Hufflepuff',
    'age' => '63'
  }
)

student1.save()
student2.save()

house1 = House.new(
  {
    'house_name' => "Gryffindor",
    'house_logo' => "https://i.pinimg.com/736x/b7/71/51/b77151ec8ecf2bbcbfe704151ab3a0ab--logo-design-house-hotel-logo-design.jpg",
    'student_id' => student1.id
  }
)

house2 = House.new(
  {
    'house_name' => "Hufflepuff",
    'house_logo' => "https://i.pinimg.com/736x/31/18/ac/3118ac5750ee55f0b31ba571e551708e--house-trees-a-house.jpg",
    'student_id' => student2.id
  }
)

house1.save()
house2.save()



binding.pry
nil
