# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Seed file
puts "Clearing DB"
puts "1"
Collection.destroy_all
puts "2"
Order.destroy_all
puts "3"
Subscription.destroy_all
puts "4"
User.destroy_all
puts "5"
Product.destroy_all


puts "Done clearing DB"

puts "Creating products"
# Create Products
product1 = Product.create!(name: "Roll of compostable bags", quantity: 100, price: 80,
  description: "Light green, PLA corn starch bag. 20 Bags Per Roll")
product2 = Product.create(name: "Starter Kit", quantity: 50, price: 100,
  description: "Start your gooi journey with a bucket, a roll of bags and a guide to our services")
puts ">>"
puts ">>"
puts "#{Product.count} products created"

puts "Creating users"
# Create users
user1 = User.create(first_name: "Zephyr", last_name: "Moonchild", address: "7 Balfour Road, Woodstock",
        phone_number: "1234567890", role: :customer, email: "zephyr@example.com", password: "password")
user2 = User.create(first_name: "Luna", last_name: "Evergreen", address: "33 St Ledger Road, Claremont",
        phone_number: "9876543210", role: :customer, email: "luna@example.com", password: "password")
user3 = User.create(first_name: "Alfred", last_name: "Starlight", address: "Khayalitsha, Cape Town",
        phone_number: "5678901234", role: :driver, email: "nova@example.com", password: "password")
puts ">>"
puts ">>"
puts "#{User.count} users created"

puts "Creating subscriptions"
# Create subscriptions
subscription1 = Subscription.create(pick_ups: 10, address: "7 Balfour Road, Woodstock", plan: "standard", status: :active, user: user1, collection_day: 2)
subscription2 = Subscription.create(pick_ups: 10, address: "33 St Ledger Road, Claremont", plan: "XL", status: :active, user: user2, collection_day: 3)
puts ">>"
puts ">>"
puts "#{Subscription.count} subscriptions created"

puts "Creating collections"
# Create collections
collection1 = Collection.create(subscription: subscription1, date: Time.now, time: Time.now,
  note: "Collected successfully", bucket_quantity: 2, bucket_type: "small")
collection2 = Collection.create(subscription: subscription2, date: Time.now, time: Time.now,
  note: "Collected successfully", bucket_quantity: 1, bucket_type: "large")
puts ">>"
puts ">>"
puts "#{Collection.count} collections created"

puts "Creating orders"
# Create orders
order1 = Order.create(quantity: 1, user: user1, product_id: product1.id)
order1.product_id = product1.id

order2 = Order.create(quantity: 1, user: user2, product_id: product2.id)
order2.product_id = product2.id
puts ">>"
puts ">>"
puts "#{Order.count} orders created"

puts "Seed file complete"
