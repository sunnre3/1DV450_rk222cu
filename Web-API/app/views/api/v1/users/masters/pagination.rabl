# A collection.
object false

node :totalUsers do |m|
	@users.total_entries
end

node :totalPages do |m|
	(@users.total_entries.to_f / @users.per_page).ceil
end

node :currentPage do |m|
	@users.current_page
end

node :perPage do |m|
	@users.per_page
end

node(:links, :if => lambda { |m| @users.next_page }) do |m|
	partial 'api/v1/users/masters/pagination_links', object: @users
end