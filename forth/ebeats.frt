#! /usr/bin/gforth

\
\
: s>beat ( x-y ) 10000000 8643042 */ ;
: squish ( x-y ) 60 * + ;
: now    (  -s ) time&date drop drop drop squish squish ;
: .ebeat ( s-  ) s>beat s>d <# # # '. hold #s '@ hold #> type ;
\
now .ebeat bye
