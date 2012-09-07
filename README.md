WebP for SASS
=============

A Ruby library allowing you to use [WebP] images effortlessly while still showing the original files to browsers that don't support WebP. Thus allowing you to serve smaller image file sizes to [WebP-compatible browsers]. Only the shown image will be downloaded by the browser. If a browser can show WebP images, it will download a WebP and not the PNG/JPG and vice-versa.

Created by Amandeep Grewal ([@amandeep]).

Prerequisites
-------------
- [Modernizr (with img-webp detect included)]
- [SASS (3.0.0+)]
- [libwebp (2.0+)]

Usage
-----
1. Place webp-sass files into a subdirectory in your SASS stylesheets directory, for example into `[project_name]/scss/webp`
1. Include the Modernizr script
1. Include the webp-sass mixins at the top of your SASS file, for example: `@import 'webp/webp';`
1. Wherever you use images, replace it with a call to the mixin `webp`, for example replace `background-image: url(../img/my_image.png);` with `@include webp(background-image, url(../img/my_image.png));`
1. Compile with SASS along with this library, for example: `$ sass --watch --compass scss:css -r ./scss/webp/webp.rb`

How it works
------------
When you make a call to the mixin `webp`, it generates a WebP image from the original image, and places it in the same directory as the original image. If the original image was a `.png`, then it generate a lossless WebP image, if it's a `.jpg` or `.jpeg `, then it's a lossly WebP image.

The arguments to the mixin are the CSS property name, and the property value. The value must be an image. The image parameter can can be specified as a url (`url(../img/my_image.png)`) or just the path (`'../img/my_image.png'`).

Contributing
------------
Any and all pull requests are welcome!

Common Issues
-------------
### No images show up, but WebP images are generated
Make sure you are including Modernizr *with the img-webp detect*. To do this go to the [Modernizr download page], add any tests you need, then go to `non-core detects` and check `img-webp`. Then include the generated script in your HTML code.

### No images show up, and WebP images are *not* generated
Ensure you have cwebp accessible from the terminal and it's version 2 or above:

```
$ cwebp -version
  0.2.0
```

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

  [Modernizr (with img-webp detect included)]: http://modernizr.com/
  [SASS (3.0.0+)]: http://sass-lang.com/
  [libwebp (2.0+)]: http://developers.google.com/speed/webp/
  [WebP]: http://developers.google.com/speed/webp/
  [@amandeep]: http://twitter.com/amandeep
  [Modernizr download page]: http://modernizr.com/download/
  [WebP-compatible browsers]: http://en.wikipedia.org/wiki/WebP#Support
