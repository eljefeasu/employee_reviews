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
    e = Employee.new(name: "Jefferson Neel", email: "jeffneel@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    assert_equal "Jefferson Neel", e.name
    assert_equal "jeffneel@mail.com", e.email
    assert_equal "919-555-5555", e.phone_number
    assert_equal 75000, e.salary
  end

  def test_add_employee_to_department
    d = Department.new("Accounting")
    e = Employee.new(name: "Jefferson Neel", email: "jeffneel@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    d.add_employee(e)
    assert_equal e, d.employees[0]
  end
end
