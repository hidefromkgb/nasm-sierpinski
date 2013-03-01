yasm -f elf tri.asm
ld -m elf_i386 -o tri tri.o
rm tri.o
