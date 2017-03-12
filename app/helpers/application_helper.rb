module ApplicationHelper
	def mean_of_rating(place)
		place.reviews.all.each do |x|
			return (x.rate_general.to_i + x.rate_safe.to_i + x.rate_clean.to_i + x.rate_scenery.to_i)/4
		end
	end
end
