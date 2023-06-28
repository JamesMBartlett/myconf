BEGIN {
  inside_file=0;
}

/SF:.*/ {
  sub("SF:", "")
  if (match(filename, ".*"$0"$")) inside_file=1;
  else inside_file=0;
}

/DA:.*/ {
  if (inside_file) {
    sub("DA:", "")
    split($0, splits, ",");
    line_num=splits[1]
    is_covered=(splits[2] > 0);
    if (is_covered) {
      if (length(covered) == 0) covered = line_num;
      else covered = covered "," line_num;
    } else {
      if (length(uncovered) == 0) uncovered = line_num;
      else uncovered = uncovered "," line_num;
    }
  }
}

END {
  print covered
  print uncovered
}
