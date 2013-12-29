image-getter
============

A proxy/facade for getting directly the images of some services based on their public url links. 

Services     	 | Endpoint
-----------------|---------------
Instagram		 | /instagram
Imgur			 | /imgur
Imgur Gallery	 | /imgur_gallery
Flickr			 | /flickr
XKCD			 | /xkcd
YouTube			 | /youtube
Vimeo			 | /vimeo

All of them share the same `url` GET parameter, and it must be used like in this example: `http://your.server.address/vimeo?url=http://vimeo.com/82495711`. 

It is ready for deployment at Heroku. 

TODO
----

* More providers!
* Caching of results
* A service for detecting if a url matches its service
* A service for getting all the known services

License
-------

Copyright (c) 2013 Nacho L.

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.