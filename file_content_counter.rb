require 'digest'

def count_files_with_same_content(path)
  content_counts = Hash.new(0)
  content_digests = {}
  content_files = {}

  Dir.glob("#{path}/**/*").each do |file|
    next unless File.file?(file)

    content_hash, digest, content = file_content(file)
    content_counts[content_hash] += 1
    content_digests[content_hash] = digest
    content_files[content_hash] = file if content_counts[content_hash] == 1 # Store the first file path for each content hash
  end

  max_count = content_counts.values.max
  max_content = content_counts.key(max_count)
  [max_content, max_count, content_digests[max_content], content_files[max_content]]
end

def file_content(file)
  content = File.read(file)
  digest = Digest::SHA256.hexdigest(content)
  [digest, Digest::SHA256.new.update(content).to_s, content]
end

# Example usage:
path_to_scan = ARGV[0] || '/path/to/your/directory'
max_content, max_count, digest_content, file_with_max_content = count_files_with_same_content(path_to_scan)
puts "Content: #{File.read(file_with_max_content) if file_with_max_content}, Count: #{max_count}"
