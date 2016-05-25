class InfoExtraPaciente < ActiveRecord::Base
		belongs_to :persona,
				   :foreign_key => "persona_id"
end
