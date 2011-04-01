#import <Foundation/NSObject.h>
#import <Foundation/NSCalendar.h>
#import <Foundation/NSDate.h>
#import <Foundation/NSLocale.h>
#import <Foundation/NSTimeZone.h>

#import <stdio.h>

@interface Ebeat : NSObject
{
  NSDate *  _today;
  NSInteger _hour;
  NSInteger _minute;
  NSInteger _second;
}
- (id)init;
- (void)print;
- (double)toEbeats;
@end
