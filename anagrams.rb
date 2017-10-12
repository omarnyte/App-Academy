def anagrams_1(str1, str2)
  all_anagrams = []

  str1_perms = permutations(str1.split(""))
  str1_perms.each do |str|
    all_anagrams << str.join("")
  end

  all_anagrams.include?(str2)
end

def permutations(arr)
  return [[]] if arr.empty?

  prev_perms = permutations(arr[0...-1])
  new_perms = []
  prev_perms.each do |perm|
    (0..perm.length).each do |idx|
      new_perms << perm.dup.insert(idx,arr.last)
    end
  end
  new_perms

end
