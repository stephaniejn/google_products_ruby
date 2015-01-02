require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)


# Problem 1 The kind of results you're are dealing are shopping#products. Go through the items and find all results that have kind of shopping#product. How many are there? Where else is this count information stored in the search results?
items = google_data["items"]
counter = 0
items.each do |i|
	if i["kind"] == "shopping#product"
		counter += 1
	end
end

puts "The number of results that have kind of shopping#product is:"
puts counter

#Problem 2 Find all items with a backorder availability in inventories.
puts "\n"'These are items on backorder:'
items.each do |i|
	if i["product"]["inventories"][0]["availability"] == "backorder"
		puts i["product"]["title"]
	end
end

#Problem 3 Find all items with more than one image link.
puts "\n" 'These items have more than one image link:'
items.each do |i|
	if i["product"]["images"].length > 1
		puts i["product"]["title"]
	end
end

#Problem 4 Find all canon products in the items. 
puts "\n" 'These are the Canon products:'
items.each do |i|
	if i["product"]["brand"] === "Canon"
		puts i["product"]["title"]
	end
end

#Problem 5 Find all items that have product author name of "eBay" and are brand "Canon".
puts "\n" 'These are Canon products with product author name eBay:'
items.each do |i|
	if i["product"]["brand"] === "Canon" && i["product"]["author"]["name"] === "eBay"
		puts i["product"]["title"]
	end
end

#Problem 6 Print all the products with their brand, price, and a image link.
puts "\n" 'These are all the products with their brand, price and image link:'
items.each do |i|
	puts "\n" 'Product: ' + i["product"]["title"] +
	"\n" 'Brand: ' + i["product"]["brand"] +
	"\n" 'Price: ' + i["product"]["inventories"][0]['price'].to_s +
	"\n" 'Image Link: ' + i["product"]["images"][0]["link"]
end





