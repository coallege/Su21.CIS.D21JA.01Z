# M2: Content Question (Basic Concepts)

Post questions about basic computer architecture. Use the first line of your post as the subject of the post.

## thread

<blockquote>
<h3>The relationship between Java Virtual Machine and Virtual Machine</h3>

The chapter mentioned Virtual Machine, I am not clear that what the relationship is between Java Virtual Machine and Virtual Machine. Is Java Virtual Machine a kind of Virtual Machine? What's the difference?
   <blockquote>
   A virtual machine just acts as a middleman between your real, physical processor and the instructions that are running. Virtual machines like what you get through Virtual Box or VMWare do a sorta similar thing to the JVM except in a much more robust and comprehensive way. Both act as a translation layer between instructions run in the machine and what's really running on the processor. The cool part about having virtual machines is that you can have one set of instructions that runs anywhere, provided that where you're trying to run it has something to translate those instructions. Class files produced by javac on my windows computer will run just fine on someone else's linux computer. The Java bytecode (instructions) are the same on both Windows and Linux but the Java Virtual Machine takes care in translating them accordingly so that they work in both environments.
   </blockquote>
</blockquote>
