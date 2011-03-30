CREATE OR REPLACE FUNCTION ebeats() RETURNS text as $$
DECLARE
  curtime timestamp := current_timestamp AT TIME ZONE 'UTC';
  hours decimal;
  minutes decimal;
  seconds decimal;
BEGIN
  SELECT EXTRACT(hour FROM curtime) INTO hours;
  SELECT EXTRACT(minute FROM curtime) INTO minutes;
  SELECT EXTRACT(second FROM curtime) INTO seconds;
  RETURN ((((1000.0/24.0) * hours)) + (((1000.0/(24.0*60.0)) * minutes)) + (((1000.0/(24.0*60.0*60.0)) * seconds)))::text;
END;
$$ LANGUAGE plpgsql;
