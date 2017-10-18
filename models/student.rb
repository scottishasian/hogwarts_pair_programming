require("pg")
require_relative("../db/sql_runner.rb")
require_relative("house.rb")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end


  def save()
    sql = "INSERT INTO students (
          first_name,
          last_name,
          house_id,
          age)

          VALUES ($1, $2, $3, $4)
          RETURNING * "
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()["id"].to_i
  end

  def delete()
    sql = "DELETE FROM students
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map{ |student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students
           WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

  def update()
    sql = "UPDATE students
         SET (first_name, last_name, house_id, age)
         = ($1, $2, $3, $4)
         WHERE id = $5"
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def house()
    sql = "SELECT * FROM houses
           WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values)
    house_info = result[0]
    house_details = House.new(house_info)
    return house_details.house_name
  end

  def house_img()
    sql = "SELECT * FROM houses
           WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values)
    house_info = result[0]
    house_details = House.new(house_info)
    return house_details.house_logo
  end


end
