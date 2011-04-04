!
! factor implementation of ebeats
!
! factor-vm ebeats.factor

USING: formatting calendar accessors math io ;
IN: ebeats

: ebeats ( -- x ) 
    gmt time-since-midnight second>>
    1000 60 60 24 * * / * "@%.2f" sprintf ;

: main  ( -- )
    ebeats print ;

MAIN: main

main

