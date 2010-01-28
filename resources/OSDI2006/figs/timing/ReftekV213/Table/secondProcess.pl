#!/usr/bin/perl -w

#print<<DONE;
#\\begin{figure}[t]
#  \\begin{small}
#    \\begin{center}
#      \\begin{tabular}{|cc|} \\hline
#        {\\bf Event} & {\\bf Shift} \\\\ \\hline
#DONE
$out = 29;
print STDERR "set xtics (";
while($line = <>) {
  @line = split(/\s+/, $line);
  $name = shift(@line);
  $out--;
  print STDERR qq{"$name" $out, };
}
print STDERR ")\n";

#print<<DONE;
#        \\hline
#      \\end{tabular}
#    \\end{center}
#  \\end{small}
#DONE
