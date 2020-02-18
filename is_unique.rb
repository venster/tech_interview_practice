
def is_unique? (word)
    #uses an array to store already seen chars
    #should run at O(n)
    is_seen = []
    
    word.each_char { |c|
        return false if is_seen.include?(c)

        is_seen << c

    }

    return true
end

def is_unique2?(word)
    # uses the uniq() to remove all extras and compare the lengths
    # unsure if this counts as NOT using an extra data structure
    return false if word.length > word.split('').uniq.length

    return true

end

def is_unique3?(word)
    #doesn't use an extra data structure
    #but it is now run at O(n^2)
    start = 0

    while start < word.length
        for n in (start+1)..(word.length-1)
            if word[n] == word[start]
                return false
            end
        end
        start += 1
    end
    return true
end


testC = 'abcdefghijk'
testW = 'abcddessghg'


puts is_unique?(testC)

puts is_unique2?(testC)
puts is_unique3?(testC)