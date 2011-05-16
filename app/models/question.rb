class Question < ActiveRecord::Base
  
  # As an administrator of a youth sports organizations, when I setup a new sport season for parents to
  #  register their children for, I want to be able to create custom questions to ask at registration time
  #  to collect information such as uniform size, game time preferences, what school they attend and the like.
  
  has_many              :responses
  
  serialize             :question_choices
  
  validates_presence_of :question_text
  validate              :validate_question_type, :validate_question_choices
  
  def valid_question_types
    ['text','single','multi']
  end
  
  # ------------------
  # Validation Methods
  # ------------------
  def validate_question_type
    errors.add(:question_type, "is not a valid question") unless ['text','single','multi'].include?(question_type)
  end
  def validate_question_choices
    case question_type
    when 'text'
      errors.add(:question_choices, "is not a valid question response") unless question_choices.blank?
    when 'single'
      errors.add(:question_choices, "is not a valid question response") unless (question_choices.length > 2)
    when 'multi'
      errors.add(:question_choices, "is not a valid question response") unless (question_choices.length > 2)
    end
  end
  # -------------------
  # /Validation Methods
  # -------------------
  
end
