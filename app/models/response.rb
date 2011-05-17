class Response < ActiveRecord::Base
  
  # As an administrator of a youth sports organizations, when I setup a new sport season for parents to
  #  register their children for, I want to be able to create custom questions to ask at registration time
  #  to collect information such as uniform size, game time preferences, what school they attend and the like.
  
  belongs_to            :question
  belongs_to            :registration
  
  serialize             :text   # Response.text is always a serialised array
  
  validate              :question_exists,
                        :adequate_response_to_question
  
  # ------------------
  # Validation Methods
  # ------------------
  def question_exists
    errors.add(:question_id, "is not a valid question") if question_id.blank? || Question.find(question_id).nil?
  end  
  def adequate_response_to_question
    q = Question.find(question_id)
    case q.question_type
    when 'text'
      errors.add(:text, "is not a valid question response") if (text.length != 1 || text.first.blank?)
    when 'single'
      errors.add(:text, "is not a valid question response") if (text.length != 1 || (text | q.question_choices).length > q.question_choices.length )
    when 'multiple'
      errors.add(:text, "is not a valid question response") if (text.length < 1 || (text | q.question_choices).length > q.question_choices.length )
    end
  end
  # -------------------
  # /Validation Methods
  # -------------------

end
