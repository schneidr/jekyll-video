Jekyll Video Tag
================

Jekyll plugin to create HTML5 markup for video files

Installation
--------------
1. Drop `jekyll-video.rb` into your Jekyll site's `_plugins` folder.
2. Add the following to your `_config.yml` and customize to taste.

``` yaml
video:
    novideo: "Custom text to be shown when the browser doesn't support the HTML5 <video> tag. {src} gets replaced with the URL to the video file."
    width: 800
    url: /files/
```

Usage
-------

Jekyll will automatically generate a HTML5 <video> tag for the specified file

```
{% video %}
path/to/video.mp4::path/to/poster.jpg
{% endvideo %}
```