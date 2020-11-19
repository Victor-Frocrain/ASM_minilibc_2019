##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

SRC			=	strlen.asm		\
				strchr.asm		\
				memcpy.asm		\
				memmove.asm		\
				memset.asm		\
				rindex.asm		\
				strcasecmp.asm	\
				strcmp.asm		\
				strcspn.asm		\
				strncmp.asm		\
				strpbrk.asm		\
				strstr.asm		\

NAME		=	libasm.so

LDFLAGS		=	-lc -dynamic-linker /lib64/ld-linux-x86-64.so.2

CC			=	ld

all:		$(NAME)

$(NAME):
		nasm -f elf64 strlen.asm
		nasm -f elf64 strchr.asm
		nasm -f elf64 memcpy.asm
		nasm -f elf64 memmove.asm
		nasm -f elf64 memset.asm
		nasm -f elf64 rindex.asm
		nasm -f elf64 strcasecmp.asm
		nasm -f elf64 strcmp.asm
		nasm -f elf64 strcspn.asm
		nasm -f elf64 strncmp.asm
		nasm -f elf64 strpbrk.asm
		nasm -f elf64 strstr.asm
		$(CC) -shared -o $(NAME) *.o

clean:
		rm -f *.o

fclean:		clean
		rm -f $(NAME)
		rm -f $(TEST_NAME)
		rm -f *.gcno
		rm -f *.gcda

re:		fclean all
