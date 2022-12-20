# Example AUv3 plug-in to demonstrate resizing bug in GarageBand & Logic

This example AUv3 plug-in (app extension) demonstrates a bug in GarageBand's and Logic's handling of window resizing. 

It presents an extremely simple UI consisting of a view containing a text label which displays the current size of the view. 

## The bug

1. Add the "ExampleAU" plug-in to a track in GarageBand or Logic, and open its UI.
   It should open with a default size of 640 x 480 and show this in the center.
   In the top right, next to "View:", "100%" should be displayed.
2. Resize the plug-in window to 90% (579 x 434)
3. Close and reopen the window.
   It will show "90%" but the actual size will now be smaller - 523 x 392
4. Each time the window is closed and reopened, it will get smaller.

If the above is repeated with a size above 100%, the window will instead grow each time it is closed and reopened.
