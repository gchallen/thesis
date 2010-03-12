#!/usr/bin/perl -w

#print<<DONE;
#\\begin{figure}[t]
#  \\begin{small}
#    \\begin{center}
#      \\begin{tabular}{|cc|} \\hline
#        {\\bf Event} & {\\bf Shift} \\\\ \\hline
#DONE
while($line = <>) {
  @line = split(/\s+/, $line);
  @directory = split(/\//, $line[2]);
  $name = pop(@directory);
  $shift = $line[3];
  $secondshift = $line[4];
  print "$name\t$shift\t$secondshift\n";
}
#print<<DONE;
#        \\hline
#      \\end{tabular}
#    \\end{center}
#  \\end{small}
#DONE
