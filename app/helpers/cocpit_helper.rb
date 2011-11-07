module CocpitHelper

	def sex(player)
	case player.sex
		when 1
			'male'
		when 2
			'female'
		else
			'Brak informacji'
		end
	end


end
