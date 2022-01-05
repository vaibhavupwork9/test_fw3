CC=gcc

BUILD_DIR=build
SOURCES= iptables.c utils.c ubus.c options.c

CFLAGS=-DDISABLE_STATIC_EXTENSIONS -DDISABLE_IPV6
LDLIBS=-L'/usr/local/lib/' -liptc -lip4tc -lip6tc -lxtables -ldl -lubox -lubus

all: prepare test_fw3

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@

OBJS=$(SOURCES:.c=.o)

prepare:
	mkdir -p $(BUILD_DIR)

test_fw3: $(OBJS)
	echo "start compilation of test_fw3"
	cd $(BUILD_DIR);$(CC) $(CFLAGS) $(OBJS) $(LDLIBS) -o ../test_fw3
	echo "test_fw3 compiled successfully"

clean:
	rm -rf $(BUILD_DIR);
	rm -f test_fw3;
