class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# my_node = Node.new 
# puts 'my_node.value'
# p my_node.value
# puts 'my_node.next_node'
# p my_node.next_node