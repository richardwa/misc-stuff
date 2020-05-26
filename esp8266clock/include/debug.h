#ifndef DEBUG_H
#define DEBUG_H

#define DEBUG 1

#define DB_SHOW(expression)                               \
  if (DEBUG)                                              \
  {                                                       \
    Serial.printf("# %s: %d\n", #expression, expression); \
  }

#endif