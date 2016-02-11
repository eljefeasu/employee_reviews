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
    e = Employee.new("Jefferson Neel", "jeffneel@mail.com", "919-555-5555", 75000)
    assert_equal "Jefferson Neel", e.name
    assert_equal "jeffneel@mail.com", e.email
    assert_equal "919-555-5555", e.phone_number
    assert_equal 75000, e.salary
  end
  
end
