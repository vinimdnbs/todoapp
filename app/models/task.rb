class Task < ActiveRecord::Base
  attr_accessible :label_id, :description, :status, :user_id

  belongs_to :label
  belongs_to :user

  validates_uniqueness_of :description, message: 'Esta tarefa ja existe', scope: :user_id
  validates_length_of :description, :in => 1..120, message: 'Digite uma tarefa com ate 140 caracteres'
end
