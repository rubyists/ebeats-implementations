<?php

require_once(dirname(__FILE__) . '/ebeats.php');

$beats = round(ebeats(), 2);
echo "The current time in ebeats: @$beats" . PHP_EOL;
