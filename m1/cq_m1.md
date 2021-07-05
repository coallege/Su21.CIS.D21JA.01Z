# M1: Content Question (data representation)

Post questions about data representation. Use the first line of your post as the
subject of the post.

## thread

> After reading the second chapter, I still don't get the difference between these two encodings. I saw that there are negative values in the latter but not the former. But how would one know when to use which one?
>> Unsigned is when you don't care about representing negative integers. It's good for stuff like array indices or counters that only go up. Signed integers include negative integers and there are two ways of doing it: one's complement and two's complement. Pretty much everything uses two's complement for representing signed integers because it's just-better. If ya don't need negative numbers, don't use signed integers.
