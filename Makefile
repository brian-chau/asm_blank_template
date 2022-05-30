# 'make'             build executable file 'mycc'
# 'make clean'       removes all .o files
# 'make clean all'   removes all .o files and executable file

# define the C compiler to use
CC := gcc
RM := rm -rf

# define any compile-time flags
CFLAGS := -masm=intel -nostdlib -static

# define the C++ source files
SRCS := $(wildcard ./target/*.s)

OBJS := $(SRCS:.s=.o)

# define the executable file
MAIN := exe

.PHONY: clean clean_all

all:    $(MAIN)
	@echo  '$(MAIN)' has been compiled

$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS)

.s.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) target/*.o *~
	$(RM) $(MAIN).dSYM

clean_all:
	$(RM) target/*.o *~ $(MAIN)
	$(RM) $(MAIN).dSYM

