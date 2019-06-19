###############################################################################################################################################################
##########################################################                PROBLEME 1                 ##########################################################
###############################################################################################################################################################

liste=[1,3,5,5,9]

def with_while(liste)
  i=0
  somme=0
  while i < liste.size do 
    somme += liste[i]
    i += 1
  end
  somme  
end
puts with_while(liste)

def with_each(liste)
  somme = 0
  liste.each do |item|
    somme += item
  end
  somme

end
puts with_each(liste)

def with_recursion(liste)
  if liste.empty?
    0
  else
    liste.first + with_recursion(liste.drop(1))
  end
end
puts with_recursion(liste)


###############################################################################################################################################################
##########################################################                PROBLEME 2                 ##########################################################
###############################################################################################################################################################


#Si les deux listes font la même taille....
def combine(a, b)
  new_table = []
  a.each_with_index do |item, i|
     new_table << item 
     new_table << b[i]
  end
  new_table
end
puts combine([:a, :b, :c], [1, 2, 3])

###############################################################################################################################################################
##########################################################                PROBLEME 3                 ##########################################################
###############################################################################################################################################################


def fibonacci
    array = [0,1]
    98.times do 
      array << array.last(2).sum
    end
    array
    
end
puts "nombre d'éléments", fibonacci.length, "c'est parti"
puts fibonacci


###############################################################################################################################################################
##########################################################                PROBLEME 4                 ##########################################################
###############################################################################################################################################################
  

mylist = [3, 34, 302, 30001, 3025, 3020, 50, 31]

def big(mylist)
  mylist.map! { |item|
    item.to_s
  }
  mylist.sort! { |a, b| b <=> a }
  
  i = 1
  while i < mylist.count do 
    mylist.each do |item|  
      next_item = mylist[i]
        if item.start_with?(next_item)
          mylist.insert(mylist.index(item),mylist.delete_at(mylist.index(next_item))) 
        end
        if next_item.start_with?(item) && next_item.reverse[0]> item[0]
          mylist.insert(mylist.index(item),mylist.delete_at(mylist.index(next_item))) 
        end 
      end
    i+=1
  end
  puts mylist.join(',')
end

big(mylist)

###############################################################################################################################################################
##########################################################                PROBLEME 5                 ##########################################################
###############################################################################################################################################################
  

def find_target(input, target)
  result = []
  stock= ["-","+",""]
  len = input.count-1

  all_combinations = stock.repeated_permutation(len).to_a
  all_combinations.each do  |combination|
    i=0
    new_array = []
    while i <= len
      new_array << input[i]
      break if i == len
      new_array << combination[i]
      i+=1
    end
    if eval(new_array.join) == target
      result << new_array
      puts "encore un, youpi"
      puts new_array.join
    end
  end
  puts "il y a ", result.count , "combinaisons possibles"
end 

puts find_target([1,2,3,4,5,6,7,8,9], 100)




