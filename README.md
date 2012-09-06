WebP for SASS
=============

A Ruby library allowing you to use WebP images effortlessly while still showing the original files to browsers that don't support WebP. Created by Amandeep Grewal ([@amandeep](http://twitter.com/amandeep)).

Prerequisites
-------------
- [Modernizr (with img-webp detect included)](http://modernizr.com/)
- [SASS (3.0.0+)](http://sass-lang.com/)
- [libwebp (2.0+)](http://developers.google.com/speed/webp/)

Usage
-----
1. Place webp-sass files into a subdirectory in your SASS stylesheets directory.
1. Include the Modernizr script
1. Wherever you use images, replace it with a call to the mixin `webp`, for example replace `background-image: url(../img/bright_squares.png);` with `@include webp(background-image, url(../img/bright_squares.png));`
1. Compile with SASS, for example: `sass --watch -r sass/webp-sass/webp.rb`

Contributing
------------
Any and all pull requests are welcome!

Copyright and license
---------------------

Copyright 2012 Amandeep Grewal

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
