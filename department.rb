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

  def give_raises(amount)
    count = 0
    @employees.each {|e| count += 1 if e.performance == "Satisfactory"}
    (distributed_amount = amount / count) if count > 0
    @employees.each {|e| e.give_raise(distributed_amount) if e.performance == "Satisfactory"}
  end

end
