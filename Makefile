
PREFIX = /usr/local

knx: knx.sh knx.awk knx.tsv
	cat knx.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz knx.awk knx.tsv >> $@
	chmod +x $@

test: knx.sh
	shellcheck -s sh knx.sh

clean:
	rm -f knx

install: knx
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f knx $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/knx

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/knx

.PHONY: test clean install uninstall
