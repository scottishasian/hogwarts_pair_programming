require("pg")

class House
  attr_reader :house_name, :house_logo, :student_id, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @house_name = options["house_name"]
    @house_logo = options["house_logo"]
    @student_id = options["student_id"].to_i
  end

  def save()
    sql = "INSERT INTO houses (
          house_name,
          house_logo,
          student_id
          )

          VALUES ($1, $2, $3)
          RETURNING *"
    values = [@house_name, @house_logo, @student_id]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run(sql, values)
    result = houses.map{ |house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses
           WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house.first)
    return result
  end
end
