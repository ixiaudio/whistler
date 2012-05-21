
// .sclang.sc

/*
This file is the parser of instructions coming from Python on the 
Audio Server Prosthetic. Currently there is only the Whistler engine,
but future engines will are possible.

In the case of the Whistler engine, an OSC message is sent from Python
to the Whistler class, which responds. Like this:

Python (sending to IP: 127.0.0.1 on Port: 57120) :
// arg order: trackID, gender, age, emotion, time, numwhistlestoday, searchterms (N numbers of)
osc.sendOSC('/render_whistle',  3233, 2, 92, "thrilled", 13, 2, "coffee", "biscuits", "new york")

And SC responds to Python (sending to IP: 127.0.0.1 on Port: 57100):
// arg order: trackID, filename
python.sendMsg('/render_whistle',  3233, "~/3233.aif")

Here other sound engines will be started as well, such as
y = Beatboxer.new;

*/

"******* sclang starting up @ ".post; Date.localtime.post; " *******".postln; 
Ê
x = Whistler.new;
y = Botstepper.new;

// the garbage collector for non-gui non-server-running non-.app Linux machines
// basically an SC bug that has been fixed in SC releases from 3.4.3 
{ inf.do({ var gca; gca = [33,44,55]; 10.wait; gca = nil; 10.wait; }) }.fork;
Ê


// For testing:

/*

// calling the class directly

x.renderMode = true;
x.compose( 316, 1, 40, "doggy", 7, 2, ["thorhallur", "birta", "loki"], true)

// or via OSC

a = NetAddr("127.0.0.1", 57120)
a.sendMsg('/render_whistle',  3233, 2, 92, "thrilled", 18, 2, "dog", "blues", "whiskey")


// testing groove (last argument to compose)
 
x = Whistler.new;

x.renderMode = false;

x.compose( 219, 1, 10, "confused", 11, 6, ["calvo", "pelambreras", "xyz"], true);

a.sendMsg('/render_whistle', 12345, 1, 10, "abcdefghijklmno", 8, 3, "xxcat", "hat", "pat")
x.compose( 11119, 1, 10, "confused", 11, 6, ["calvo", "pelambreras", "xyz"], true);
x.compose( 16, 1, 60, "sad", 18, 2, ["calvo", "wine", "porro"], true);
x.compose( 23316, 1, 60, "funky", 23, 2, ["dogs", "cats", "chocolate"], true);

x.compose( 2336, 2, 30, "funky", 23, 2, ["ziiggy", "fodd", "chocolate"], true);

x.compose( 4433, 1, 90, "funky", 7, 2, ["hotdog", "coke", "love"], true);



*/



