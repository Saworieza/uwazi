class Contest < ActiveRecord::Base
    has_many :politicians

  def politicians
    Politician.where(:coalition_id => self.id).to_a 
  end
end
