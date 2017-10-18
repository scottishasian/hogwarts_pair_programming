require("pg")

class House
  attr_reader :house_name, :house_logo, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @house_name = options["house_name"]
    @house_logo = options["house_logo"]
  end

  def save()
    sql = "INSERT INTO houses (
          house_name,
          house_logo
          )

          VALUES ($1, $2)
          RETURNING *"
    values = [@house_name, @house_logo]
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
