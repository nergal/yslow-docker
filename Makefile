export QT_QPA_PLATFORM=offscreen

define \n


endef

DOCKER=sudo docker
PHANTOMJS=phantomjs --ssl-protocol=any --ignore-ssl-errors=yes
PWD=$(shell pwd)
LISTURL=$(subst ${\n}, ,$(URLS))

DOMAIN=https://www.qa.hotwire.com
ifeq ($(ENV),prod)
	override DOMAIN = https://www.hotwire.com
endif

all: clean build run

clean:
	rm -f reports/report*.xml

build:
	$(DOCKER) build -t yslow-docker .

run:
	$(DOCKER) run -e "ENV=$(ENV)" -e "URLS=$(LISTURL)" -e "THRESHOLD=$(THRESHOLD)" -v $(PWD):/usr/src/app yslow-docker /usr/bin/make yslow

yslow:
	I=0; \
	for URL in $(URLS); do \
		I=`expr $$I + 1`; \
		$(PHANTOMJS) "$(PWD)/yslow.patched.js" -i grade -thrashold "$(THRESHOLD)" -f junit "$(DOMAIN)$$URL"  | grep -v "FAIL to load" | sed "s@name=\"YSlow\"@name=\"$$URL\"@g" > "reports/report$$I.xml"; \
	done
