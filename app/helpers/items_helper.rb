module ItemsHelper
	def favorites_link_for(item)
		if item.favorite
			asset_path 'favorited.png' 
		else
			asset_path 'notfavorited.png' 
		end
	end

	def process_disclaimer(string)
		# Matches [*=May contain raw or uncooked meats]
		disclaimerPattern = /\ \[\*\=(.+)\]/

		# RegExp replace
		string.sub(disclaimerPattern, ' <span class="tooltip" data-tooltip="$1">*</span>')
	end
end
