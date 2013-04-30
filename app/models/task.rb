class Task < ActiveRecord::Base
  attr_accessible :label_id, :description, :status

  belongs_to :label

  validates :description, uniqueness:{message: 'Esta tarefa ja existe'}
  validates_length_of :description, :in => 1..120, message: 'Digite uma tarefa com ate 140 caracteres'
end
