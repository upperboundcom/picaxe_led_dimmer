# picaxe_led_dimmer

This is LED Dimmer code for a Picaxe microcontroller

The readadc function is used to read the value from a potentiometer. A conversion is done to get a duty value for the pwmout function, controlling the LED brightness.

Note that the readadc function reads into an 1-byte value with a maximum of 255 while the pwmout duty value is a 2-byte word with a maximum value of 1023.

If this were an Arduino, we could use the map() function to convert a value in the range 0-255 to 0-1023.

But, I'm using a 08M2 which has some limitations:

1. There's no map() function
1. The map() function uses long int math which is not supported on the 08M2. So, just copying the formula from the Arduino map() reference is not going to work. 

We'll just have to work with 2 byte words. 

This code uses the same formula as the Arduino map() function but divides the 1 and 2 bytes into 4 pieces before doing the multipication to avoid long int overflows. Everything gets multipled by 4 at the end to get a final value that will fit into a 2 byte word needed for pwmout.

## tasks.json

This file contains tasks for Visual Studio Code (vscode) for compiling and debugging.  Use of this is entirely optional and only applies if you're using vscode for Picaxe development.

You may need to tweak some values for your environment, like the path for your the picaxe compiler(s).  The current compiler path is for the 08M2. 