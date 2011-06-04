
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


x = Whistler.new;



// For testing:

/*

// calling the class directly

x.renderMode = false;
x.compose( 16, 1, 60, "doggy", 12, 2, ["axa", "ici", "oco"])

// or via OSC

a = NetAddr("127.0.0.1", 57120)
a.sendMsg('/render_whistle',  3233, 2, 92, "thrilled", 13, 2, "coffee", "biscuits", "new york")

*/



