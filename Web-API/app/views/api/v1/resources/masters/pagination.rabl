# A collection.
object false

node :totalResources do |m|
	@resources.total_entries
end

node :totalPages do |m|
	(@resources.total_entries.to_f / @resources.per_page).ceil
end

node :currentPage do |m|
	@resources.current_page
end

node :perPage do |m|
	@resources.per_page
end

node(:links, :if => lambda { |m| @resources.next_page }) do |m|
	partial 'api/v1/resources/masters/pagination_links', object: @resources
end