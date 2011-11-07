module ApplicationHelper

	def premium(player)
		case player.kp
			when 1
				'aktywne'
			else
				'nieaktywne'
		end
	end
	
	def warns(player)
		case player.warns
			when 1
				'Brak'
			when 2
				2
			when 3
				3
			else
				0
		end
	end

	def organization(player)
		case player.organization
			when 1
				'Bayside Police Department'
			when 2
				'Bayside Fire Department'
			when 3
				'Urząd'
			when 4
				'Bayside News FM'
			else
				'Brak'
		end
	end
	
		def organizationrank(player)
		case player.organization
			when 1
					# Bayside Police Department
					case player.rank
					when 1
						'Kadet'
					when 2
						'Posterunkowy'
					when 3
						'Funkcjonariusz'
					when 4
						'Oficer jednostki specjalnej'
					when 5
						'Dowódca wydziału'
					when 6
						'Komendant'
					else
						'Brak'
					end
			when 2
					# Bayside Fire Department
					case player.rank
					when 1
						'Uczeń'
					when 2
						'Funkcjonariusz'
					when 3
						'Dowódca wydziału'
					when 4
						'Komendant'
					else
						'Brak'
					end
			when 3
					# Urząd
					case player.rank
					when 1
						'Pracownik urzędu'
					when 2
						'Komornik'
					when 3
						'Radny'
					when 4
						'Burmistrz'
					else
						'Brak'
					end
			when 4
					# Bayside News FM
					case player.rank
					when 1
						'Praktykant'
					when 2
						'Prezenter radiowy'
					when 3
						'Dziennikarz'
					when 4
						'Prezes rozgłośni'
					else
						'Brak'
					end
			else
				'Brak'
		end
	end
	
	def job(player)
		case player.job
			when 1
				'Mechanik'
			when 2
				'Dostawca pizzy'
			when 3
				'Detektyw'
			when 4
				'Diler aut'
			when 5
				'Diler narkotyków'
			when 6
				'Diler broni'
			else
				'Bezrobotny'
		end
	end
	
	def opinion(player)
		case player.player_level
			when 1
				'Nowy'
			when 2
				'Wtajemniczony'
			when 3
				'Zaufany gracz'
			when 4
				'Stały gracz'
			else
				'Brak'
		end
	end
	
	
	def materials(player)
		case player.bank
			when 0..3000
				'Biedny'
			when 3000..6000
				'Normalny'
			when 6000..10000
				'Bogaty'
			else
				'Bogaty'
		end
	end


end
