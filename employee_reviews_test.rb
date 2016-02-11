require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews.rb'

class EmployeeReviewsTest < Minitest::Test

  def test_employee_class_exists
    assert Employee
  end

  def test_department_class_exists
    assert Department
  end

  def test_create_department_with_name
    assert_equal "Accounting", Department.new("Accounting").name
  end

  def test_create_employee
    e = Employee.new(name: "Jefferson Neel", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    assert_equal "Jefferson Neel", e.name
    assert_equal "jeff@mail.com", e.email
    assert_equal "919-555-5555", e.phone_number
    assert_equal 75000, e.salary
  end

  def test_add_employee_to_department
    d = Department.new("Accounting")
    e = Employee.new(name: "Jefferson Neel", email: "neel@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    d.add_employee(e)
    assert_equal e, d.employees[0]
  end

  def test_department_total_salary
    d = Department.new("Accounting")
    e1 = Employee.new(name: "Jefferson Neel", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e2 = Employee.new(name: "Molly Gehring", email: "molly@mail.com",
                     phone_number: "123-456-7890", salary: 75000)
    d.add_employee(e1)
    d.add_employee(e2)
    assert_equal 150000, d.total_salary
  end

  def test_add_employee_review
    e = Employee.new(name: "Jefferson Neel", email: "neel@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e.add_review("Jeff is a good employee and does everything we ask. He is the best
    person we have ever had in our company. We should give him a huge raise because of
    his amazing ability and we can't afford to lose him.")
    assert_equal "Jeff is a good employee and does everything we ask. He is the best
    person we have ever had in our company. We should give him a huge raise because of
    his amazing ability and we can't afford to lose him.", e.review
  end
end
