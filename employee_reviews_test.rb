require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews.rb'

class EmployeeReviewsTest < Minitest::Test

  private def negative_review_one
    "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.
    There are two areas in which Zeke has room for improvement.  First, when communicating verbally
    (and sometimes in writing), he has a tendency to use more words than are required.
    This conversational style does put people at ease, which is valuable, but it often makes the meaning
    difficult to isolate, and can cause confusion.

    Second, when discussing new requirements with project managers, less of the information is retained
    by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing
    features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught
    because the tests lack the same information, and 3) clients are told that certain features are complete
    when they are inadequate.  This communication limitation could be the fault of project management,
    but given that other developers appear to retain more information, this is worth discussing further."
  end

  private def negative_review_two
    "Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her
    in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally
    be expected.  This most commonly manifests during development on existing applications, but can sometimes
    occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate
    for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.

    Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her
    volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the
    client or other attendees have clearly ruled the issue out, and can sometimes get off topic."
  end

  private def positive_review_one
    "Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned
    to him, implements code that rarely needs to be revisited, and is always willing to help others despite
    his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go

    Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months,
    he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts
    with estimates on Acme, clients are happy with his work and responsiveness, which is everything that
    his managers could ask for."
  end

  private def positive_review_two
    "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her
    work, developers are impressed with her productivity, and she's more than willing to help others even when
    she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys
    working with her.  During the past year, she has largely been devoted to work with the Cement Company, and
    she is the perfect woman for the job.  We know that work on a single project can become monotonous, however,
    so over the next few months, we hope to spread some of the Cement Company work to others.  This will also
    allow Wanda to pair more with others and spread her effectiveness to other projects."
  end


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
    e = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    assert_equal "Jefferson", e.name
    assert_equal "jeff@mail.com", e.email
    assert_equal "919-555-5555", e.phone_number
    assert_equal 75000, e.salary
  end

  def test_add_employee_to_department
    d = Department.new("Accounting")
    e = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    d.add_employee(e)
    assert_equal e, d.employees[0]
  end

  def test_department_total_salary
    d = Department.new("Accounting")
    e1 = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e2 = Employee.new(name: "Molly", email: "molly@mail.com",
                     phone_number: "123-456-7890", salary: 75000)
    d.add_employee(e1)
    d.add_employee(e2)
    assert_equal 150000, d.total_salary
  end

  def test_add_employee_review
    e = Employee.new(name: "Zeke", email: "Zeke@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e.add_review(negative_review_one)
    assert_equal negative_review_one, e.review
  end

  def test_employee_performance
    e = Employee.new(name: "Jefferson", email: "neel@mail.com",
                     phone_number: "919-555-5555", salary: 75000)

  end

  def test_give_raise_to_individual
    e = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e.give_raise(10000)
    assert_equal 85000, e.salary
  end

  def test_give_departments_raises_based_on_performance
    d = Department.new("Accounting")
    e1 = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e2 = Employee.new(name: "Molly", email: "molly@mail.com",
                     phone_number: "123-456-7890", salary: 75000)
    e3 = Employee.new(name: "Jonathan", email: "jonathan@mail.com",
                     phone_number: "123-123-1234", salary: 75000)
    e1.add_review(positive_review_one)
    e2.add_review(positive_review_two)
    e3.add_review(negative_review_one)
    assert e1.get_performance
    assert e2.get_performance
    refute e3.get_performance
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    d.give_raises(10000) {|e| e.performance}
    assert_equal 80000, e1.salary
    assert_equal 80000, e2.salary
    assert_equal 75000, e3.salary
  end

  def test_give_departments_raises_based_on_salary
    d = Department.new("Accounting")
    e1 = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e2 = Employee.new(name: "Molly", email: "molly@mail.com",
                     phone_number: "123-456-7890", salary: 75000)
    e3 = Employee.new(name: "Jonathan", email: "jonathan@mail.com",
                     phone_number: "123-123-1234", salary: 75000)
    e1.add_review(positive_review_one)
    e2.add_review(positive_review_two)
    e3.add_review(negative_review_one)
    assert e1.get_performance
    assert e2.get_performance
    refute e3.get_performance
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    d.give_raises(30000.0) {|e| e.salary < 100000}
    assert_equal 85000, e1.salary
    assert_equal 85000, e2.salary
    assert_equal 85000, e3.salary
  end

  def test_give_deparments_raises_based_on_employee_name
    d = Department.new("Accounting")
    e1 = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                     phone_number: "919-555-5555", salary: 75000)
    e2 = Employee.new(name: "Molly", email: "molly@mail.com",
                     phone_number: "123-456-7890", salary: 75000)
    e3 = Employee.new(name: "Jonathan", email: "jonathan@mail.com",
                     phone_number: "123-123-1234", salary: 75000)
    e1.add_review(positive_review_one)
    e2.add_review(positive_review_two)
    e3.add_review(negative_review_one)
    assert e1.get_performance
    assert e2.get_performance
    refute e3.get_performance
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    d.give_raises(10000.0) {|e| e.name == "Jefferson"}
    assert_equal 85000, e1.salary
    assert_equal 75000, e2.salary
    assert_equal 75000, e3.salary
  end
end
