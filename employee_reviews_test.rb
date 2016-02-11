require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews.rb'

class EmployeeReviewsTest < Minitest::Test

  def test_employee_class_exists
    assert Employee
  end

end
