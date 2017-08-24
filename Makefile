CC    := gcc
FLAGS := -shared -fPIC
NAME  := dickbutt
LIB   := $(NAME)-lib

all: $(LIB).so

$(LIB).so: $(LIB).c
	$(CC) $(FLAGS) -o $@ $<

test: all
	clisp $(NAME).lisp

clean:
	rm -f $(LIB).so
