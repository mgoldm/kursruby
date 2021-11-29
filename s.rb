def quick_sort(array, beg_index, end_index)
  if beg_index < end_index
    pivot_index = partition(array, beg_index, end_index)
    quick_sort(array, beg_index, pivot_index -1)
    quick_sort(array, pivot_index + 1, end_index)
  end
  array
end

def partition(array, beg_index, end_index)
  current_index = beg_index
  i = beg_index
  while i < end_index do
    if array[i] <= array[end_index]
      swap(array, i, current_index)
      current_index += 1
    end
    i += 1
  end

  swap(array, end_index, current_index)
  current_index
end

def swap(array, first_element, second_element)
  temp = array[first_element]
  array[first_element] = array[second_element]
  array[second_element] = temp
end

mass = [2, -3, 2, 1, 5, 10, 7, -15]
puts quick_sort(mass, 0, mass.length - 1).inspect
