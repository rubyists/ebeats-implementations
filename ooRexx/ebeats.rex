/* ooRexx implementation of ebeats.                                */
/*                                                                 */
/* Unfortunatly, ooRexx doesn't seem to handle DST timezone offset */
/* calculations properly, so the easiest way is to run it with:    */
/* TZ=UTC rexx ebeats.rex                                          */

Say "@" || (.DateTime~new~daySeconds * 0.01157407)~trunc(2) 

