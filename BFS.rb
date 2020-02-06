class Node
    attr_reader :next_arr, :visited, :value
    attr_writer :visited, :next_arr

    def initialize(value, next_arr = [], visited = false)
        @next_arr = next_arr
        @visited = visited
        @value = value
    end
end

def search(current_node, target_node)
    if current_node == target_node
        return true;
    end
    current_node.visited = true
    current_node.next_arr.each do |next_node|
        if !next_node.visited
           return search(next_node,target_node)
        end
    end
    return false
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)

node1.next_arr = [node2]
node2.next_arr = [node4]
node3.next_arr = [node4]

puts search(node1,node3)