#!/usr/bin/env ruby
#
#
# LINUX or UNIX will be needed to un thris
# REQUIRES: wc, rm, sed, cat
#


#Needs to be puts on server/linux to run.




loop {
	puts "Enter: Read, Write, Delete, Last, Lines, Average, Exit"
	ans = gets.chomp
	case ans.downcase
	when 'write'
		#Working
		a = "test.txt"
		b = File.open(a, "a")
		puts "Enter Time in minutes"
		c = gets.chomp.to_s
		puts "Enter Distance in miles"
		d = gets.chomp.to_s
		b.puts "Time: " + c + " Distance: " + d 
		b.close
	when 'average'
		#Working
		a = File.open("test.txt", "r").read
		array1 = a.split(" ")

		b = array1.values_at(* array1.each_index.select {|i| i.odd?})
		c = b.map(&:to_i)

		dist = c.values_at(* c.each_index.select {|i| i.odd?})
		tim = c.values_at(* c.each_index.select {|x| x.even?})

		distt = dist.inject(:+)
		timt = tim.inject(:+)
		lines = `wc -l test.txt`
		lines = lines.to_f
		fin1 = timt / lines
		fin2 = distt / lines
		fin3 = fin2 / fin1
		#Testing Use

		#puts c.inspect
		#puts distt
		#puts timt
		puts "Average Time: (minutes) " + fin1.to_s
		puts "Average Distance: (miles) " + fin2.to_s
		puts "Time/Distance Average: " + fin3.to_s

	when 'last'
		#Working
		a = IO.readlines("test.txt")
		puts a[-1]
	when 'delete'
		#Working
		puts "Enter to delete: All or Line"
		ans = gets.chomp
		case ans.downcase
			when 'all'
				puts "You will need to enter a write command to recreate the file "
				`rm test.txt`
			when 'line'
				puts "Enter line to delete"
				c = gets.chomp.to_i
				c = c - 1
				b = `wc -l test.txt`
				b = b.to_i
				if c > b
					b = b.to_s
					puts "File only has " + b + " lines"
				else
					c = c + 1
					c = c.to_s

					`sed -i.bak -e '#{c}d' test.txt`
					puts "All lines afterward will be shifted up"

				end
			end
	when 'lines'
		#Working
		b = `wc -l test.txt`
		b = b.to_i
		b = b.to_s
		puts "The file has " + b + " lines"
	when 'read'
		#Working
		puts "Enter to read: All or Line"
		ans = gets.chomp
		case ans.downcase
			when 'line'
		        puts "Enter line to read"
		        c = gets.chomp.to_i
		        c = c - 1
		        b = `wc -l test.txt`
		        b = b.to_i
		        if c > b
		        	b = b.to_s
		        	puts "File only has " + b + " lines"
		        else
		        	a = IO.readlines("test.txt")
		        	puts a[c]
		        end
		    when 'all'
		    	a = `cat test.txt`
		    	puts "Full file output"
		    	puts a
		    end
	when 'exit'
		exit
	else
		puts "Please enter a valid command"

end
}

