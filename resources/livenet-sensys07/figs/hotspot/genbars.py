#!/usr/bin/env python
import sys

def main():
    fname = sys.argv[1]
    f=open(fname)
    print """
            XAxis: :
            YAxis: Packets: -labelalign center -labeldist 0.5
            Key: right-(1.4*inch), top+(0.3*inch): : -keytitlealign center
            Options: -subplotspacing 0.1 -size 5x3 -ticfont helvetica9 -plotspacing 1.0 -labeldist 0.5 -xlabel 0.2 -textfont helvetica8 -labelfont helvetica8 -keyframe 0 -valueangle 90 -valuefont helvetica10 -valuealign left -topmargin 0.75 -bottommargin 0.85 -rightmargin 0.2 -leftmargin 0.85 -xlabelfont helvetica8
    #Bar: 0 : :
    """
    for l in f:
        #sys.stdout.write(l)
        if l[0] != '#':
            (id,route_maintenance,query,status,queryreply_missing,queryreply_observed,status_missing,status_observed) =l.split()
            if id == '21':
                print """
                BeginStackBar:  :
                Bar: 0: route maintenance       :-pattern fill -inkey
                Bar: 0: query : -pattern x_4 -inkey
                Bar: 0: observed status : -pattern fill -inkey
                Bar: 0: inferred status : -pattern horiz_4 -inkey
                Bar: 0: observed query reply: -pattern fill -inkey
                Bar: 0: inferred query reply:  -pattern right_4 -inkey
                EndStackBar
                """ 

            if id == '61' or id == '100':
                print "Bar: 0 : :"
            print "#"+id
            print """
            BeginStackBar: %s :
            Bar: %s: route maintenance       :-pattern fill
            Bar: %s: query : -pattern x_4
            Bar: %s: observed status : -pattern fill
            Bar: %s: inferred status : -pattern horiz_4
            Bar: %s: observed query reply: -pattern fill
            Bar: %s: inferred query reply: -printvalue -pattern right_4
            EndStackBar
            """ % (id,route_maintenance,query,status_observed, status_missing,queryreply_observed, queryreply_missing)

                    


if __name__ == "__main__":
    main()
