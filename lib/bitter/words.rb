module Bitter

  WORDS = File.open(File.join(File.expand_path(File.dirname(__FILE__)),
                    '..', '..', 'words.txt'))
              .readlines
              .map(&:strip)
              .reject(&:empty?)

end
