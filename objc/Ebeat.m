#import "Ebeat.h"

@implementation Ebeat

- (id)init
{
  self = [super init];

  NSTimeZone * utc = [NSTimeZone timeZoneWithName:@"UTC"];
  NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  [gregorian setTimeZone:utc];

  _today = [NSDate date];
  NSDateComponents * date_parts = [gregorian components:(NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:_today];

  _hour   = [date_parts hour];
  _minute = [date_parts minute];
  _second = [date_parts second];

  [utc release];
  [gregorian release];

  return self;
}

- (void)print
{
  printf("%.2lf\n", [self toEbeats]);
}

- (double)toEbeats
{
  return (_hour   * 1000.0 / 24.0) +
         (_minute * 1000.0 / 1440.0) +
         (_second * 1000.0 / 86400.0);
}

@end
