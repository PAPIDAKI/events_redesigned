class Registration < ActiveRecord::Base
  belongs_to :event

  validates :name,presence:true
  validates :email,format:{with:/(\S+)@(\S+)/}
  HOW_HEARD_OPTIONS= %w(option1 Newsletter BlogPost Twitter 'Web Search' Other)
  validates :how_heard,
             inclusion: {in: HOW_HEARD_OPTIONS}

end