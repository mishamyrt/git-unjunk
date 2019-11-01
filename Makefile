.PHONY: test
UNAME := $(shell uname)

test:
	./test.sh

install:
	make install_$(UNAME)

install_Darwin:
	cp ./bin/git-unjunk /usr/local/bin/git-unjunk
	chmod +x /usr/local/bin/git-unjunk

install_Linux:
	cp ./bin/git-unjunk /usr/bin/git-unjunk
	chmod +x /usr/bin/git-unjunk
