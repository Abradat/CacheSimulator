# Analytics


## Direct mapping
#### PRO / CONS
Direct mapping issimple and inexpensive to implement, but if a program accesses 2 blocks that map to the same line
repeatedly,the cache begins to thrash back and forth reloading the line over and over again leadsto high missrate.

## Fully Associative
#### PRO / CONS
Fully Associative isthe most efficient utilisation of cache blocks, yet it is expensive to transverse through the cache to
find each requested tag. Since there is no specified slot for each instruction, an algorithm of replacement policy must
be designed along with implementation of fully associative cache.

## N-way set associative
#### PRO / CONS
Combining direct mapped and fully associative principle is seen as the most balanced way to obtain high hit rate
meanwhile maintaining the resources cost. However, N-Way associative could be hard for initial implementation as
various conceptsisinvolved.

# Comparison of Cache Mapping Techniques
There is a critical tradeoff in cache performance that has led to the creation of the various cache mapping techniques described in the previous section. In order for the cache to have good performance you want to maximize both of the following:

Hit Ratio: You want to increase as much as possible the likelihood of the cache containing the memory addresses that the processor wants. Otherwise, you lose much of the benefit of caching because there will be too many misses.
Search Speed: You want to be able to determine as quickly as possible if you have scored a hit in the cache. Otherwise, you lose a small amount of time on every access, hit or miss, while you search the cache.
Now let's look at the three cache types and see how they fare:

## Direct Mapped Cache
The direct mapped cache is the simplest form of cache and the easiest to check for a hit. Since there is only one possible place that any memory location can be cached, there is nothing to search; the line either contains the memory information we are looking for, or it doesn't.
Unfortunately, the direct mapped cache also has the worst performance, because again there is only one place that any address can be stored. Let's look again at our 512 KB level 2 cache and 64 MB of system memory. As you recall this cache has 16,384 lines (assuming 32-byte cache lines) and so each one is shared by 4,096 memory addresses. In the absolute worst case, imagine that the processor needs 2 different addresses (call them X and Y) that both map to the same cache line, in alternating sequence (X, Y, X, Y). This could happen in a small loop if you were unlucky. The processor will load X from memory and store it in cache. Then it will look in the cache for Y, but Y uses the same cache line as X, so it won't be there. So Y is loaded from memory, and stored in the cache for future use. But then the processor requests X, and looks in the cache only to find Y. This conflict repeats over and over. The net result is that the hit ratio here is 0%. This is a worst case scenario, but in general the performance is worst for this type of mapping.
## Fully Associative Cache 
The fully associative cache has the best hit ratio because any line in the cache can hold any address that needs to be cached. This means the problem seen in the direct mapped cache disappears, because there is no dedicated single line that an address must use.
However (you knew it was coming), this cache suffers from problems involving searching the cache. If a given address can be stored in any of 16,384 lines, how do you know where it is? Even with specialized hardware to do the searching, a performance penalty is incurred. And this penalty occurs for all accesses to memory, whether a cache hit occurs or not, because it is part of searching the cache to determine a hit. In addition, more logic must be added to determine which of the various lines to use when a new entry must be added (usually some form of a "least recently used" algorithm is employed to decide which cache line to use next). All this overhead adds cost, complexity and execution time.
## N-Way Set Associative Cache
The set associative cache is a good compromise between the direct mapped and set associative caches. Let's consider the 4-way set associative cache. Here, each address can be cached in any of 4 places. This means that in the example described in the direct mapped cache description above, where we accessed alternately two addresses that map to the same cache line, they would now map to the same cache set instead. This set has 4 lines in it, so one could hold X and another could hold Y. This raises the hit ratio from 0% to near 100%! Again an extreme example, of course. As for searching, since the set only has 4 lines to examine this is not very complicated to deal with, although it does have to do this small search, and it also requires additional circuitry to decide which cache line to use when saving a fresh read from memory. Again, some form of LRU (least recently used) algorithm is typically used.
# Summary
| Cache Type                 | Hit Ratio     | Search Speed  |
| -------------------------- |:-------------:| :-------------:|
| Direct Mapped              | Good          | Best         |
| Fully Associative          | Best          |   Moderate         |
| N-Way Set Associative, N>1 | Very Good, Better as N Increases      |    Good, Worse as N Increases         |

In the "real world", the direct mapped and set associative caches are by far the most common. Direct mapping is used more for level 2 caches on motherboards, while the higher-performance set-associative cache is found more commonly on the smaller primary caches contained within processors.

![alt text](https://github.com/Abradat/CacheSimulator/blob/master/CacheSimulator/cahrt.png)
