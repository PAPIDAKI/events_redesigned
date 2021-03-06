class Registration < ActiveRecord::Base
  belongs_to :event

  validates :name,presence:true
  validates :email,format:{with:/(\S+)@(\S+)/}
  HOW_HEARD_OPTIONS= %w(Newsletter BlogPost Twitter WebSearch Friend Other)
  validates :how_heard,
             inclusion: {in: HOW_HEARD_OPTIONS}



end