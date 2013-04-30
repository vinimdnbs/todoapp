class Label < ActiveRecord::Base
  attr_accessible :name

  has_many :tasks, dependent: :destroy

  validates :name, uniqueness:{message: 'Este label ja existe'}
  validates_length_of :name, :in => 1..16, message: 'Digite um nome para o label com ate 20 caracteres'
end
