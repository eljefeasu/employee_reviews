class Employee
  attr_reader :name, :email, :phone_number, :salary, :review

  def initialize(name:, email:, phone_number:, salary:)
    @name = name
    @email = email
    @phone_number = phone_number
    @salary = salary
  end

  def add_review(review)
    @review = review
  end
end
