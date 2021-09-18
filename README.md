# Exercise-1-Drawing
The drawing exercise for EECS 1710. The faster you move, the larger the brush is and the faster the colour changes.

I'm starting to realize that the .txt probably wasn't necessary, so just pay attention to the .pde. If the .txt doesn't show up at all, ignore this.

The majority of the description for this program is provided as needed in the comments of the file. Be aware that this README will just contain some additional notes.

Also, something probably isn't completely right in this submission, as I don't clearly know how to do it (submit). If so, please let me know. 

---

- The size changes based on speed, however I made the decision not to allow the size to drop to zero. I think this was the right decision, because if the speed was zero, the user would get no input at all from the program (ie, it wouldn't even draw a circle in the same place with a slightly changing colour). However, I think it would be interesting to experiment with a drawing program that sometimes doesn't draw.

- The colour also changes smoothly, but doesn't change saturation or value. It would be interesting to test a program that also produces darker or greyer colours depending on speed, but I wanted to keep this one simple. Also, such complex colour changing using an RGB system (instead of HSB, HSV, etc) is significantly more complex than the scope of this project (or my skill).

- I understand that this method of changing colours is really inefficient, but my knowledge of Processing is really limited, and it works well enough. There was probably some way to do the same thing using a switch statement, but I don't know how.

- I saw that I had the ability to export this as an executable file, and was able to access this file from my computer, but wasn't able to send it over Github (the file size was too large). Should I have submitted it? Or is it not relevant?
