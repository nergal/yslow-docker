YSlow Docker
============

Usage: `make all`

Environment variables:

* `DOMAIN` - *(required)* domain for testing pages
* `URLS` - *(required)* list of urls separated by space or new line
* `THRASHOLD` - YSlow level of thrashold (default _85_)

> *NB:* YSlow patch includes using `require('system').args` instead of `phantom.args`.