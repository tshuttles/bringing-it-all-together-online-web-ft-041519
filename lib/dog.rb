class Dog 
  
  attr_accessor :id, :name, :breed 
  
  def initialize(id:nil, name:, breed:)
    @id = id 
    @name = name 
    @breed = breed 
  end 
  
  def self.create_table 
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT)
    SQL
    
    DB[:conn].execute(sql) 
  end 
  
  def self.drop_table 
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(sql)
  end 
  
  def save
  end 
  
  def self.create 
  end 
  
  def self.find_by_id 
  end 
  
  def self.find_or_create_by 
  end 
  
  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    breed = row[2]
    self.new(id, name, breed)
  end 
  
  def self.find_by_name 
    sql = <<-SQL
      SELECT *
      FROM dogs 
      WHERE name = ?
      LIMIT 1 
    SQL
    
    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first 
  end 
  
  def update 
  end 
end 