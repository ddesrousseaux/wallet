def listdir(dirname, recursive=false)
  d = Dir.new(dirname)
  d.each {|x|
    if (x!='.' && x!='..')
      if File.directory?(dirname+File::SEPARATOR+x)
        puts "DIR #{dirname+File::SEPARATOR+x}"
        if recursive
          listdir(dirname+'/'+x)
        end
      elsif
        puts "FILE #{dirname+File::SEPARATOR+x} " + File.stat(dirname+File::SEPARATOR+x).size.to_s
        requireIfRuby(dirname+File::SEPARATOR+x)
      end
    end
  }
end

def requireIfRuby(file)
  if File.extname(file) == ".rb"
    puts "including " + file
    require file
  end
end


listdir(".")