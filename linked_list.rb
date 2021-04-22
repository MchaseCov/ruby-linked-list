require_relative 'Node'

class LinkedList
  # returns the first and last node with these readers!
  attr_reader :head, :tail

  # By default, head and tail pointers equal to nil, nothing!
  def initialize
    @head = nil
    @tail = nil
  end

  # if the head pointer is empty, assign it and the tail to the new entry and then set the head of the next node to the tail that leads into it, else the tail is equal to the tail of the new entry!
  def append(value)
    if @head.nil?
      @head = @tail = Node.new(value)
      @head.next_node = @tail
    else
      @tail = @tail.next_node = Node.new(value)
    end
  end

  # Same as above but else sets previous entry to the header value, the header value to the new value, and then the header of next node to old head value that we saved to the side.
  def prepend(value)
    if @head.nil?
      @head = @tail = Node.new(value)
      @head.next_node = @tail
    else
      previous_entry = @head
      @head = Node.new(value)
      @head.next_node = previous_entry
    end
  end

  # Is 0 by default. If empty, 0. If head=tail, then 1. Else, go through the entire node until youre at the last tail of nil and then give the amount total.
  def size
    count = 0
    pointer = @head
    return count if @head.nil?
    return count + 1 if @head == @tail

    until pointer.nil?
      count += 1
      pointer = pointer.next_node
    end
    count
  end

  # Starts same as above. Takes in index requested. Returns nil if nothing. Until you go through the entire list, look for where the listing number == request number and then return that pointer (@head) value!
  def at(index)
    listings = 0
    pointer = @head
    return 'nil' if index > size - 1

    until pointer.nil?
      return pointer.value if listings == index

      listings += 1
      pointer = pointer.next_node
    end
  end

  # Pointer = @head, then set pointer to next node until you reach the tail that references the head (the previous listing).
  def pop
    return puts 'Cannot remove the last value as the list is empty!' if head.nil?

    if size == 1
      @head = nil
      @tail = nil
      return
    end
    pointer = @head
    pointer = pointer.next_node until pointer.next_node == @tail
    pointer.next_node = nil
    @tail = pointer
  end

  # Goes through entire list and see if the value you are looking for is contained and returns true/false
  def contains?(value)
    pointer = @head
    until pointer.nil?
      return true if pointer.value == value

      pointer = pointer.next_node
    end
    false
  end

  # Enter a value. If found, will return the index that this value is stored at!
  def find(value)
    listings = 0
    pointer = @head
    until pointer.nil?
      return listings if pointer.value == value

      listings += 1
      pointer = pointer.next_node
    end
    "Cannot find the entry '#{value}' in the list."
  end

  # Returns the list as a string value in the ( value ) -> ( value ) -> ( value ) -> nil format
  def to_s
    string = ''
    count = 0
    pointer = @head
    until pointer.nil?
      string << "( #{pointer.value} ) -> "
      count += 1
      pointer = pointer.next_node
    end
    string << 'nil'
    puts string
  end
end


