#!/bin/bash

nasm -f elf32 -g -F dwarf "${1}" &&
  ld -m elf_i386 -s -o "${1%.asm}" "${1%.asm}.o"
