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

  def get_performance
    positive_words = 0
    negative_words = 0

    positive_regex = [/positive/i, /encourage/i, /valuable/, /[^not] useful/i,
                      /\badequate/, /well/, /asset/, /\bpleasure/, /quick?l?y/,
                      /help others/, /\bsuccess/, /\bhappy/, /\bconsistent/,
                      /\beffective/, /\bsatisfied/, /\bimpressed/, /\bwilling/,
                      /asset/, /joy/, /\bperfect/]
    negative_regex = [/not done/i, /room for improvement/i, /tendency/i, /difficult/i,
                      /confusion/i, /negative/i, /not useful/i, /inadequate/i,
                      /limitation/i, /concerns?/i, /longer/i, /interrupt/i,
                      /talk over others/i, /dwell/i, /off topic/i, /concern?s/i,
                      /unsuccessful/i, /inconsistent/i, /ineffective/i, /unwilling/i]

    if @review
      positive_regex.each do |w|
        words = @review.scan(w).count
        positive_words += words
      end

      negative_regex.each do |w|
        words = @review.scan(w).count
        negative_words += words.to_i
      end

      if positive_words > negative_words
        @performance = true
      else
        @performance = false
      end

    else
      puts "No review given. Cannot give performance score"
    end
  end

  def give_raise(amount = 0)
    @salary += amount
  end
end
