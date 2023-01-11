require_relative 'node.rb'
require 'pry-byebug'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end
  
  def size
    count = 1
    current = @head
    if current.nil?
      0
    else
      until current.next_node.nil?
        count += 1
        current = current.next_node
      end
      count
    end
  end

  def tail
    current = @head
    if current.nil?
      nil
    else
      current = current.next_node until current.next_node.nil?
      current
    end
  end

  def at(index)
    if index == 0
      @head
    else
      current = @head
      index.times { current = current.next_node }
      current
    end
  end

  def contains?(value)
    current = @head
    until current.value == value
      return false if current.next_node.nil?
      current = current.next_node
    end
    true
  end

  def find(value)
    count = 1
    current = @head
    if @head.value == value
      0
    else
      until current.value == value
        count += 1
        current = current.next_node
      end
      count
    end
  end

  def to_s
    str = ""
    current = @head
    until current.next_node.nil?
      new_str = "( #{current.value} ) -> "
      str += new_str
      current = current.next_node
    end
    str += "( #{tail.value} ) -> nil"
    str
  end


end

my_list = LinkedList.new

p my_list.head
p my_list.tail
p my_list.append(3)
p my_list.prepend(7)
p my_list.append(4)
p my_list.append(5)
p my_list.head
p my_list.tail
p my_list.size
p my_list.head
p my_list.at(0)
p my_list.contains?(6)
p my_list.find(7)
puts my_list.to_s