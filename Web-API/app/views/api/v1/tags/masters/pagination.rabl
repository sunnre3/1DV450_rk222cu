# A collection.
object false

node :totalTags do |m|
	@tags.total_entries
end

node :totalPages do |m|
	(@tags.total_entries.to_f / @tags.per_page).ceil
end

node :currentPage do |m|
	@tags.current_page
end

node :perPage do |m|
	@tags.per_page
end

node(:links, :if => lambda { |m| @tags.next_page }) do |m|
	partial 'api/v1/tags/masters/pagination_links', object: @tags
end