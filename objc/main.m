#import "Foundation/NSAutoreleasePool.h"
#import "Ebeat.h"

int main(int argc, const char * argv[], const char * envp[])
{
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  Ebeat * ebeats = [[Ebeat alloc] init];

  [ebeats print];

  [ebeats release];

  [pool release];

  return 0;
}
