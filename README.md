# CacheSimulator

## Cache Memory

1. Cache Memory is very high speed memory used to increase the speed of program by making current program & data available to the CPU at a rapid rate.

2. Access time to cache memory is less compared to main memory. It contains a copy of potions of the main memory.

3. When CPU attempts to read a word from main memory, check is made to determine if the word is in cache. It so, then word is delivered form cache.

4. If word is not there in cache then a block of main memory consisting some word along with that word, is read into cache and the required word is delivered to CPU. This is called “Principle of Locality of Reference”.

5. During a miss if there are no empty blocks in the cache, then some replacement policies such as FIFO, LRU, LFU, etc. are used.
![alt text](https://github.com/Abradat/CacheSimulator/blob/master/CacheSimulator/1.png)
