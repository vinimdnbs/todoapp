class Label < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates_uniqueness_of :name, message: 'Este label ja existe', scope: :user_id
  validates_length_of :name, :in => 1..16, message: 'Digite um nome para o label com ate 20 caracteres'
end
