# frozen_string_literal: true

require_relative 'linked_list'

list = LinkedList.new

list.append(2)
list.append(7)
list.append(5)

list.prepend(8)
list.prepend(1)

puts 'Your current list is:'

puts list

puts "The head value is #{list.head.value}."

puts "The tail value is: #{list.tail.value}."

puts "The list is #{list.size} entries long."

puts "The value of the node at index 2 is: #{list.at(3)}"

puts 'Now removing final entry of the list'
list.pop

puts "The list is #{list.size} entries long."

puts "It is #{list.contains?(5)} that the list contains 5"

puts "The index of the entry where 5 is stored is: #{list.find(5)}"

puts 'Printing string of your list!'

list.to_s
