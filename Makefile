NAME = App
LDFLAGS = # libraries go here
CFLAGS = -Ilib/ -std=c++17 -O0 -Wall -Wpedantic
CC = cc

LIB_SOURCES = \
	# lib sources go here

LIB_OBJECTS = $(LIB_SOURCES:%.cpp=build/obj/%.o)

MAIN_SOURCES = \
	# main sources go here

MAIN_OBJECTS = $(MAIN_SOURCES:%.cpp=build/obj/%.o)

all: $(NAME)
	build/$(NAME)

build: $(NAME)

clean:
	@rm build/obj/*.o
	@echo "Cleaned build directory"

.PHONY: all build clean

$(NAME): $(LIB_OBJECTS) $(MAIN_OBJECTS)
	@$(CC) $(LDFLAGS) -o build/$(NAME) $^

$(LIB_OBJECTS): build/obj/%.o: dir/to/lib/%.c
	@echo $(subst dir/to/lib/,,$<)
	@$(CC) -c $(CFLAGS) -o $@ $<

$(MAIN_OBJECTS): build/obj/%.o: src/%.c
	@echo $(subst dir/to/src/,,$<)
	@$(CC) -c $(CFLAGS) -o $@ $<
