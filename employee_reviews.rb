require './employee.rb'
require './department.rb'

d = Department.new("Accounting")
e1 = Employee.new(name: "Jefferson", email: "jeff@mail.com",
                 phone_number: "919-555-5555", salary: 75000)
e2 = Employee.new(name: "Molly", email: "molly@mail.com",
                 phone_number: "123-456-7890", salary: 75000)
e3 = Employee.new(name: "Jonathan", email: "jonathan@mail.com",
                 phone_number: "123-123-1234", salary: 75000)

@negative_review_one = "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.
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

@negative_review_two = "Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her
in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally
be expected.  This most commonly manifests during development on existing applications, but can sometimes
occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate
for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.

Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her
volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the
client or other attendees have clearly ruled the issue out, and can sometimes get off topic."

@positive_review_one = "Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned
to him, implements code that rarely needs to be revisited, and is always willing to help others despite
his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go

Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months,
he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts
with estimates on Acme, clients are happy with his work and responsiveness, which is everything that
his managers could ask for."

@positive_review_two = "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her
work, developers are impressed with her productivity, and she's more than willing to help others even when
she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys
working with her.  During the past year, she has largely been devoted to work with the Cement Company, and
she is the perfect woman for the job.  We know that work on a single project can become monotonous, however,
so over the next few months, we hope to spread some of the Cement Company work to others.  This will also
allow Wanda to pair more with others and spread her effectiveness to other projects."

@internet_positive_one = "Jim continues to be a valued member of our crew and is a person we are able to count on. Jim's focus to his attendance and punctuality has made our core group operate significantly better over the past 12 months.

Tim is extremely dependable with regard to his attendance and regularly exhibits punctuality.

Janet starts every day refreshed and ready for any problems she may face throughout the work day.

George often makes certain his workers adhere to their lunch schedules and breaks. "



e1.add_review(@internet_positive_one)
e2.add_review(@positive_review_two)
e3.add_review(@negative_review_one)

d.add_employee(e1)
d.add_employee(e2)
d.add_employee(e3)

puts e1.get_performance
puts e2.get_performance
puts e3.get_performance
