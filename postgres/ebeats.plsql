CREATE OR REPLACE FUNCTION ebeats() RETURNS text as $$
DECLARE
  curtime timestamp := current_timestamp AT TIME ZONE 'UTC';
  hours decimal;
  minutes decimal;
  seconds decimal;
  bpday decimal := 1000;
  bphour decimal := 24;
  bpmin decimal := bphour * 60;
  bpsec decimal := bpmin * 60;
BEGIN
  SELECT EXTRACT(hour FROM curtime) INTO hours;
  SELECT EXTRACT(minute FROM curtime) INTO minutes;
  SELECT EXTRACT(second FROM curtime) INTO seconds;
  RETURN '@' || FLOOR((bpday/bphour * hours) + (bpday/bpmin * minutes) + (bpday/bpsec * seconds))::text;
END;
$$ LANGUAGE plpgsql;
