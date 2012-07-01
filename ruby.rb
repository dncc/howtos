#----------------- Post by Tomayko Ryan ---------------------------- 
#----------------- count words in AWK-ward Ruby -------------------- 
#
curl -s http://www.gutenberg.org/files/1080/1080.txt |
ruby -ne '
  BEGIN { $words = Hash.new(0) }

  $_.split(/[^a-zA-Z]+/).each { |word| $words[word.downcase] += 1 }

  END {
    $words.each { |word, i| printf "%3d %s\n", i, word }
  }
' |
sort -rn

#-------------------- Same thing in AWK ----------------------------
#curl -s http://www.gutenberg.org/files/1080/1080.txt |
#awk '
#    BEGIN { FS="[^a-zA-Z]+" }
#
#    {
#        for (i=1; i<=NF; i++) {
#            word = tolower($i)
#            words[word]++
#        }
#    }
#
#    END {
#        for (w in words)
#             printf("%3d %s\n", words[w], w)
#    }
#' |
#sort -rn
#--------------------------------------------------------------------- 
