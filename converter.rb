system('ls -l')
# system('ffmpeg')
# system('gem list')
File.write('converted/test.txt', 'Some glorious content')
p '@@@@@@@@@@@@@@@@@@@@@@'
system('ls -l converted')
system('cat converted/test.txt')
p 'my work here is done!'
