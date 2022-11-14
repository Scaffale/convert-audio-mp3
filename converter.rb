require 'fileutils'
require 'parallel'

def convert_to(file_to_convert, final_path, start_path)
  final_file_no_format = [final_path, file_to_convert.split(start_path)[1]].join('')
  final_dir = final_file_no_format.split('/')[0...-1].join('/')
  FileUtils.mkdir_p final_dir
  comand = "ffmpeg -n -loglevel panic -i \"#{file_to_convert}\" -ab 192k -map_metadata 0 -id3v2_version 3 \"#{detach_stuff(final_file_no_format, '.')}.mp3\""
  if system(comand)
    system("rm \"#{file_to_convert}\"")
  end
end

def search_dirs(audio_format, start_path, dest_path)
  files = Dir["#{start_path}/**/*.#{audio_format}"]
  p "Converto i file #{audio_format}"
  Parallel.each(files, progress: "Converting") do |file|
    convert_to(file, dest_path, start_path)
  end
end

def detach_stuff(file, detach_char)
  file.split(detach_char)[0...-1].join(detach_char)
end

starting_folder = 'to_convert'
destination_folder = 'to_convert'

%w[mp4 ogg avi flac m4a wav wma aac].each { |audio_format|
  search_dirs(audio_format, starting_folder, destination_folder)
}
