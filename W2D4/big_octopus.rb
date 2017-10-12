FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus
  sluggish_fishes = FISHES.dup

  sorted = false
  until sorted

    sorted = true

    sluggish_fishes.each_index do |i|
      next if i == sluggish_fishes.length
      j = i + 1
      while j < sluggish_fishes.length
        if sluggish_fishes[i].length > sluggish_fishes[j].length
          sorted = false
          sluggish_fishes[i], sluggish_fishes[j] = sluggish_fishes[j], sluggish_fishes[i]
        end
        j += 1
      end
    end
  end

  return sluggish_fishes.last
end

def clever_octopus
  clever_fishes = FISHES.dup

  biggest_fish = clever_fishes.first

  clever_fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end
  biggest_fish
end



moves = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, moves)
  moves.each_with_index do |tile, index|
    return index if tile == direction
  end
end


  moves = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, moves)
  moves[direction]
end
