def sluggish_octopus(array)
  array.each_with_index do |fish1, i|
    max_length = true
    array.each_with_index do |fish2, j|
      next if i == j
      max_length = false if fish2.size > fish1.size
    end
    return fish1 if max_length
  end


end


def dominant_octopus(array)
  array.sort_by{|fish| fish.size}.last
end


def linear_octopus(array)
  longest_fish = []
  longest_length = 0
  array.each_with_index do |fish, idx|
    if fish.size > longest_length
      longest_length = fish.size
      longest_fish = [fish]
    end
  end
  longest_fish
end

def slow_dance(dir, step_tiles)
  step_tiles.each_with_index do |step, i|
    return i if dir == step
  end
  nil
end

tiles_hash = {
  "up" => 0,
 "right-up" => 1,
 "right"=> 2,
 "right-down" => 3,
 "down" => 4,
 "left-down" => 5,
 "left" => 6,
 "left-up" => 7
}

def quick_dance(dir, tiles_hash)
  tiles_hash[dir]
end
