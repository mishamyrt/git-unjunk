UNAME := $(shell uname)

install:
	make install_$(UNAME)

install_Darwin:
	cp ./git-unjunk /usr/local/bin/git-unjunk
	chmod +x /usr/local/bin/git-unjunk

install_Linux:
	cp ./git-unjunk /usr/bin/git-unjunk
	chmod +x /usr/bin/git-unjunk
