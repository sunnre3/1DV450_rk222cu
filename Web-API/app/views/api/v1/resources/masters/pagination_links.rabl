# A collection.
object false

node(:previous, :if => lambda { |m| @resources.current_page > 1 }) do |m|
	api_v1_resources_url + '?page=' + @resources.previous_page.to_s
end

node(:next, :if => lambda { |m| @resources.next_page }) do |m|
	api_v1_resources_url + '?page=' + @resources.next_page.to_s
end