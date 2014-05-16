# A collection.
object false

node(:previous, :if => lambda { |m| @users.current_page > 1 }) do |m|
	api_v1_resources_url + '?page=' + @users.previous_page.to_s
end

node(:next, :if => lambda { |m| @users.next_page }) do |m|
	api_v1_resources_url + '?page=' + @users.next_page.to_s
end