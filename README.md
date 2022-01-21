## Assembly Calculator
Assembly program that gets the sum, difference, product, and quotient of two numbers, and displays whether n1 is a multiple of n2, n2 is a multiple of n1, both, or neither.
> Author: Will Nigel De Jesus

## Task
You are to create an assembly program that would get the sum, difference, product, quotient, and remainder of two numbers, n1 and n2. You are also to display whether n1 is a multiple of n2 or n2 is a multiple of n1, or both, or neither. 


## Procedure
The program should accept two numbers, n1 and n2. You should be displaying the ff: 
> 1. The result of n1 +n2 
> 2. The result of n1 − n2 
> 3. The result of n1 * n2 
> 4. The result of n1 ÷ n2 along with its remainder 
> 5. Whether n1 is a multiple of n2 
> 6. Whether n2 is a multiple of n1 


## Usage
Compiling/Running:
> nasm -f elf assemblycalc.asm
> 
> gcc assemblycalc.o -o assemblycalc -m32
> 
> ./assemblycalc

Required lib: gcc-multilib g++multilib
Installation:
> sudo apt-get install gcc-multilib g++-multilib
