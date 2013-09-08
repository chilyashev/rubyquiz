=begin
  A mad libs parser
=end


def mad_libs(string)
  vars = Hash.new
  final = Hash.new
  reserved = []
  string.scan(/\(\((.*?)\)\)/).each do |var|
    var = var[0]
    ind = var.index(':')
    if ind
      reserved.push(var[0..ind-1])
      vars[var.strip] = ''
    else
      unless reserved.include? var
        vars[var.strip] = ''
      end
    end
  end
  #print "Original string: #{string}\n"

  vars.keys.each do |var|
    ind = var.index(':')
    if ind
      val = var[ind+1..-1].strip
      key = var[0..ind-1]
      print "Please enter #{val}: "
      v = gets.strip
      final["((#{key}))"] = v
      final["((#{var}))"] = v
    else
      print "Please enter #{var}: "
      final["((#{var}))"] = gets.strip
    end
  end

  final.each do |var|
    unless string[var[0]].nil?
      string[var[0].to_s] = var[1].to_s
    end
  end
  print "\nResult: #{string}\n"
end

# Too lazy to add an option to read stuff from a text file
# Demonstration:
string = 'I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun)).'
mad_libs string
string = 'Our favourite language is ((gem: a gemstone)). We think ((gem)) is better than ((a gemstone))'
mad_libs string
string = 'No tokens in here'
mad_libs string