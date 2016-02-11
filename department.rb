class Department
  attr_reader :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(e)
    @employees << e
  end

  def total_salary
    total_salary = 0
    @employees.each do |e|
      total_salary += e.salary
    end
    total_salary
  end

end
