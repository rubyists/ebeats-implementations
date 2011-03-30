<?php

/**
 * PHP implementation of the Ebeats time system. Using this function is very simple,
 * simply call it and you're good to go. Note that the return value is a floating
 * point number and not an integer.
 *
 * For more information on the ebeats notation visit http://ebeats.org/
 *
 * @example
 *  ebeats(); // => 769.641203704
 *
 * @author  Yorick Peterse <info@yorickpeterse.com>
 * @link    http://yorickpeterse.com/
 * @license http://code.yorickpeterse.com/license.txt The MIT license
 * @return  float The current time in beats.
 */
function ebeats()
{
    // Extract the details of the current data
    $timestamp = strtotime(gmdate('d-m-Y H:i:s'));
    $date      = getdate($timestamp);
    $per_day   = 1000.0;

    // Get all individual time elements used to build the beats time
    $seconds   = $per_day / (24 * 60 * 60);
    $minutes   = $per_day / (24 * 60);
    $hours     = $per_day / 24;

    $beats  = ($date['seconds'] * $seconds) + ($date['minutes'] * $minutes);
    $beats += $date['hours'] * $hours;

    return $beats;
}
