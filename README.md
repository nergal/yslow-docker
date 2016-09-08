YSlow Docker
============

Usage: `make all`

Environment variables:

* `URLS` - *(required)* list of urls separated by space or new line
* `THRASHOLD` - YSlow level of thrashold (default _85_)
* `ENV` - environment to test, _qa_ or _prod_ (default _qa_)

> *NB:* YSlow patch includes using `require('system').args` instead of `phantom.args`.