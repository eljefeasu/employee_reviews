class Employee
  attr_reader :name, :email, :phone_number, :salary, :review, :performance

  def initialize(name: , email:, phone_number:, salary:)
    @name = name
    @email = email
    @phone_number = phone_number
    @salary = salary
  end

  def add_review(review)
    @review = review
  end

  def set_performance(performance)
    @performance = performance
  end

  def give_raise(amount = 0)
    @salary += amount
  end
end
