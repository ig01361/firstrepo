PROGRAM=hello
SOURCES=$(wildcard *.c)
OBJS=$(SOURCES:.c=.o)
DEPS=$(SOURCES:.c=.d)
CFLAGS=-Wall -g -MMD
.PHONY: all clean run tags

all: $(PROGRAM) tags
clean:
	$(RM) $(OBJS) $(DEPS) $(PROGRAM) tags
run: $(PROGRAM)
	./$(PROGRAM)
tags:
	ctags -R

$(PROGRAM): $(OBJS)
-include $(DEPS)
