require('pry')
require_relative('../models/student.rb')

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


binding.pry
nil
