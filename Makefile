
default:	build

clean:
	rm -rf Makefile objs

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/usr/sbin -t

	kill -USR2 `cat /usr/logs/nginx.pid`
	sleep 1
	test -f /usr/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/logs/nginx.pid.oldbin`
	
uninstall:
	rm -rf /usr/sbin/nginx
	rm -rf /var/log/nginx
	rm -rf /etc/nginx


.PHONY:	build install modules upgrade
