# a simple method to handle financial data.  
* import into csv files
* data can be committed and versioned
* summerize data for annual tax purposes
* separated anually, to allow data to grow indefinately without slowing down
* data is both program friendly and person friendly - like markdown

## Other Considerations
* import should handle different formats "smartly"
  * ideally can import from different bank formats
  * try different date formats to figure out the date
  * support different delimiters for import
* rows that look exactly the same will be assumed to be a duplicate

## output format:
1. date: yyyy-mm-dd
2. category: string, default: none
2. amount: float to 2 decimal places, negative indicates expense
3. description: string

import.py data-buffer.csv > data-2019.csv, data-2020.csv, etc

