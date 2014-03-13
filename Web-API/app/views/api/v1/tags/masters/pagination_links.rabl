# A collection.
object false

node(:previous, :if => lambda { |m| @tags.current_page > 1 }) do |m|
	api_v1_resources_url + '?page=' + @tags.previous_page.to_s
end

node(:next, :if => lambda { |m| @tags.next_page }) do |m|
	api_v1_resources_url + '?page=' + @tags.next_page.to_s
end