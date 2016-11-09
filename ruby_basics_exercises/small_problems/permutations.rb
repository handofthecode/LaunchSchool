def per(a)
  a.size==1 ? a : a.map {|n| per(a-[n]).map {|v| [n, v].flatten} }.flatten(1)
end

p per [1, 2, 3, 4, 6, 7]






