TouchableScrollView
===================

A potentially awkward pattern on iOS is when you have a UISlider control layered on top of a UIScrollView. 

Both objects will want to respond to swipe gestures, and users will have to "aim" their swipe at the UISlider very, very carefully to avoid having the UIScrollView swallow up the event (and inadvertently, "scroll" to the page).

A solution to this problem is to create a "guarded" slider control.

This code demonstrates how to implement this in iOS.

[![](http://farm4.static.flickr.com/3137/5717563982_42632c0fca.jpg)](http://farm4.static.flickr.com/3137/5717563982_42632c0fca.jpg)
