#ifndef DEBUG_H
#define DEBUG_H

#define DEBUG 0

#define SHOW(expression)                                  \
  if (DEBUG)                                              \
  {                                                       \
    Serial.printf("# %s: %d\n", #expression, expression); \
  }

#define PRINT(str)       \
  if (DEBUG)             \
  {                      \
    Serial.println(str); \
  }

#endif