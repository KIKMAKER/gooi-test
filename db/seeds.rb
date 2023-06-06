# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Seed file
puts "Clearing DB"
puts "1"
CollectionRecord.destroy_all
puts "2"
Collection.destroy_all
puts "3"
Order.destroy_all
puts "4"
Subscription.destroy_all
puts "5"
User.destroy_all
puts "6"
StockItem.destroy_all

puts "Done clearing DB"

puts "Creating stock items"
# Create stock items
stock_item1 = StockItem.create(name: "Roll of compostable bags", quantity: 100, price: 80)
puts ">>"
puts ">>"
puts "#{StockItem.count} stock item created"

puts "Creating users"
# Create users
user1 = User.create(first_name: "Alice", last_name: "Anderson", address: "Claremont, Cape Town",
        phone_number: "1234567890", role: :customer, email: "alice@example.com", password: "password")
user2 = User.create(first_name: "Bob", last_name: "Brown", address: "Gardens, Cape Town",
        phone_number: "9876543210", role: :customer, email: "bob@example.com", password: "password")
user3 = User.create(first_name: "Charlie", last_name: "Clark", address: "Muizenberg, Cape Town",
        phone_number: "5678901234", role: :driver, email: "charlie@example.com", password: "password")
puts ">>"
puts ">>"
puts "#{User.count} users created"

puts "Creating subscriptions"
# Create subscriptions
subscription1 = Subscription.create(pick_ups: 10, status: :active, user: user1)
subscription2 = Subscription.create(pick_ups: 10, status: :active, user: user2)
puts ">>"
puts ">>"
puts "#{Subscription.count} subscriptions created"

puts "Creating orders"
# Create orders
order1 = Order.create(quantity: 1, stock_item: stock_item1, user: user1)
order2 = Order.create(quantity: 1, stock_item: stock_item1, user: user2)
puts ">>"
puts ">>"
puts "#{Order.count} orders created"

puts "Creating collections"
# Create collections
collection1 = Collection.create(order_id: order1.id, subscription: subscription1, user: user1)
collection2 = Collection.create(order_id: order2.id, subscription: subscription2, user: user2)
puts ">>"
puts ">>"
puts "#{Collection.count} collections created"

puts "Creating collection records"
# Create collection records
collection_record1 = CollectionRecord.create(date: Date.today, time: Time.now, note: "Collected successfully", bucket_quantity: 2, bucket_type: "small", collection: collection1)
collection_record2 = CollectionRecord.create(date: Date.today, time: Time.now, note: "Collected successfully", bucket_quantity: 1, bucket_type: "large", collection: collection2)
puts ">>"
puts ">>"
puts "#{CollectionRecord.count} collection records created"

puts "Seed file complete"
