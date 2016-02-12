class Employee
  attr_reader :name, :email, :phone_number, :salary, :review

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
                      /\beffective/, /\bsatisfied/, /\bimpressed/, /\bwilling/i,
                      /asset/, /joy/, /\bperfect/, /[^not] high level/, /better/,
                      /exceptional/i, /steady/i, /strong/i, /unstopped/i, /exceed/i,
                      /done right/i, /solid/i, /\bconsistent/i]
    negative_regex = [/not done/i, /room for improvement/i, /tendency/i, /difficult/i,
                      /confusion/i, /negative/i, /not useful/i, /inadequate/i,
                      /limitation/i, /concerns?/i, /longer/i, /interrupt/i,
                      /talk over others/i, /dwell/i, /off topic/i, /concern?s/i,
                      /unsuccessful/i, /inconsistent/i, /ineffective/i, /unwilling/i,
                      /late/i, /lazy/i, /behind/, /unpredictable/i, /not consistent/i,
                      /miss/i]

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
        positive_performance = negative_words.to_f/positive_words.to_f

        if positive_performance >= 0.0 && positive_performance <= 0.25
          performance = 5.0
        elsif positive_performance > 0.25 && positive_performance <= 0.5
          performance = 4.0
        else
          performance = 3.0
        end

      elsif negative_words > positive_words
        negative_performance = positive_words.to_f/negative_words.to_f

        if negative_performance >= 0.0 && negative_performance <= 0.25
          performance = 0.0
        elsif negative_performance > 0.25 && negative_performance <= 0.5
          performance = 1.0
        else
          performance = 2.0
        end
      else
        performance = 2.5
      end

    else
      puts "No review given. Cannot give performance score"
    end
  end

  def give_raise(amount = 0)
    @salary += amount
  end
end
