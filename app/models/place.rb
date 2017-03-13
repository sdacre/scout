class Place < ApplicationRecord
  mount_uploaders :image, ImageUploader
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
  has_many :reviews
  # include PgSearch
  #  multisearchable against: [:name, :city, :country, :description]
#    pg_search_scope :search_places, :against => [
#   [:name,        'A'],
#   [:city,        'B'],
#   [:country,     'C'],
#   [:description, 'D']
# ],
#                   :using => {
#     tsearch:    {dictionary: 'english'},
#     trigram:    {threshold:  0.1},
#     dmetaphone: {}
#   }

end

  # pg_search_scope :search,
  #                 :against => [:name, :city, :address, :country, :description],
  #                 :using => {tsearch: {:dictionary => "english"}}
#   def self.place_search(query)
#     if query.present?
#       # search(query)
#       rank = <<-RANK
#       ts_rank(to_tsvector(name)), plainto_tsquery(#{sanitize(query)}) +
#       ts_rank(to_tsvector(city)), plainto_tsquery(#{sanitize(query)}) +
#     ts_rank(to_tsvector(country)), plainto_tsquery(#{sanitize(query)}) +
#   ts_rank(to_tsvector(address)), plainto_tsquery(#{sanitize(query)}) +
# ts_rank(to_tsvector(description)), plainto_tsquery(#{sanitize(query)})
# RANK
# where("to_tsvector('english', name) @@ :q or to_tsvector('english', city) @@ :q or to_tsvector('english', country) @@ :q or to_tsvector('english', address) @@ :q or to_tsvector('english', description) @@ :q", q: query).order("#{rank} desc")
#  else
#       scoped
#     end
#   end
