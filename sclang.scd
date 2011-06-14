
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
Ê
// the garbage collector for non-gui non-server-running non-.app Linux machines
// basically an SC bug that has been fixed in new SC 3.4.3 releases
{ inf.do({ var gca; gca = [33,44,55]; 10.wait; gca = nil; 10.wait; }) }.fork;
Ê


// For testing:

/*

// calling the class directly

x.renderMode = false;
x.compose( 16, 1, 40, "doggy", 7, 2, ["axa", "ici", "oco"], true)

// or via OSC

a = NetAddr("127.0.0.1", 57120)
a.sendMsg('/render_whistle',  3233, 2, 92, "thrilled", 18, 2, "dog", "blues", "whiskey")


// testing groove (last argument to compose)
 
x = Whistler.new;

x.renderMode = false;

x.compose( 16, 1, 10, "confused", 11, 6, ["calvo", "pelambreras", "xyz"], true);

a.sendMsg('/render_whistle', 12345, 1, 10, "abcdefghijklmno", 8, 3, "xxcat", "hat", "pat")
x.compose( 16, 1, 10, "confused", 11, 6, ["calvo", "pelambreras", "xyz"], true);
x.compose( 16, 3, 60, "sad", 18, 2, ["calvo", "wine", "porro"], true);


*/



