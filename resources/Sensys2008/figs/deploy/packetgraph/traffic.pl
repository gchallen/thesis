
use Date::Parse;

my $WINDOW = 15;

my @messages = ("ReplyMsg", "ContinuousSamplingMsg", "FetchReplyMsg", "GPSReceiverMsg", "TimeSyncMsg", "UtilityStreamerMsg", "CtpMsg");
my $messages = 0;
my %stats;

my $time;
while (<STDIN>) {
    if (m/logmsg time=\"([^ ]*).\"/) {
        # each packet it its place; a place for each packet.
        $time = int(str2time($1));
        $time -= $time % $WINDOW;
        #print $time . "\n";
    } elsif (m/\<([^ \/a-z][a-zA-Z]*)/) {
        my $tag = $1;
        $stats{$time}->{$tag}++;  
    }
    $messages++;
    print STDERR "Parse $messages\n" if ($messages % 10000 == 0);
    #goto DONE if ($messages % 10000 == 0);
}
 DONE:

print "#time\t";
foreach my $m (@messages) {
    print "$m\t";
}
print "\n";

my %totals;

foreach my $time (sort keys %stats) {
    next if (length($time) == 0);
    print "$time\t";
    foreach my $m (@messages) {
        if (defined($stats{$time}->{$m})) {
            print $stats{$time}->{$m} . "\t";
            $totals{$m} += $stats{$time}->{$m};
        } else {
            print "0\t";
        }
    }
    print "\n";
}


print <<EOL;
#
# TOTALS
#
EOL
print "#\t";
foreach my $m (@messages) {
    print $totals{$m} . "\t";
}
print "\n";
