class Node
    attr_reader :next_arr, :visited, :value
    attr_writer :visited, :next_arr

    def initialize(value, next_arr = [], visited = false)
        @next_arr = next_arr
        @visited = visited
        @value = value
    end
end

#checks if the target value can be reached from the start node
def find_bf_search?(start_node, target_node)
    queue = Queue.new
    queue << start_node

    while !queue.empty?
        current_node = queue.pop
        return true if current_node == target_node

        current_node.next_arr.each { |next_node|
            if !next_node.visited
                #this is here because if it's added to the queue, 
                #it is considered visited, because it WILL be visited and checked
                next_node.visited = true 
                queue.push(next_node) 
            end
        }
    end
    return false
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)

node1.next_arr = [node3,node2]
node2.next_arr = [node4]
node3.next_arr = [node2]

puts find_bf_search?(node1,node4)