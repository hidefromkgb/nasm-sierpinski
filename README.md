nasm-sierpinski
===============

A short x86 assembly program that generates Sierpinski triangles.<br>
Order of magnitude may vary from 0 (single character) to 20 (circa 3 terabytes of raw data).<br>
Spaces in quotes on line 23 are nonbreaking, since in UTF-8 they are exactly 2 bytes in size.
Coupled with the next line (3 bytes for triangle + 1 byte for «ordinary» space), this allows for a precise byte-character correlation: 2 chars = 4 bytes.<br>
Compatible with Linux ≥ 2.6.

Input:
 - decimal number from 0 to 20 (careful!)

Output:
 - the resulting triangle
