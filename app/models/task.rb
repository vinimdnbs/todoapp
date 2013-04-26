class Task < ActiveRecord::Base
  attr_accessible :label_id, :name, :status

  belongs_to :label
end
