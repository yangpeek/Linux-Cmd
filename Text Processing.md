1. Print text block if seached text in the block.
  ```
  perl -l -0777 -ne 'for (m{------------------------------------------------------------------------.*?------------------------------------------------------------------------}gs) {print if /mobile {/}' sniffer_rsp > sniffer_rsp_mobile
  ```
2. Sum column alias / sum column by field id:
awk '{s+=$0} END {print s}'
awk '{s[$1]+=$3}END{for(i in s){print i, s[i]}}' file.txt

3. Vim 
  - Add / Remove comment for text block:
    * :10,100s/^/#/
    * :10,100s/^#//
  - Vim auto format:
    * gg=G

4. Looping file lines:
cat a | while read line; do grep "$line" a.file; done

5. Merge two lines into one line:
sed 'N;s/\n/ /' yourFile
