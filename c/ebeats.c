#include <stdio.h>
#include <time.h>

double tm_to_beats(struct tm * t);

double
tm_to_beats(struct tm * t)
{
  double beats;

  beats = t->tm_hour * (1000.0 / 24.0) +
          t->tm_min  * (1000.0 / (24.0 * 60.0)) +
          t->tm_sec  * (1000.0 / (24.0 * 60.0 * 60.0));

  return beats;
}

int main(int argc, char * argv[], char * envp[])
{
  time_t      now;
  struct tm * now_tm;

  now = time(NULL);
  now_tm = gmtime(&now);

  printf("@%.2lf\n", tm_to_beats(now_tm));

  return 0;
}
