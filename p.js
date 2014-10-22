var minim = null;
var in = null;
var fft = null;
var note = null; 
var n = 0; 
var c = 0x00000000;

var sampleRate =  44100;  
var max =  $p.createJavaArray('float', [sampleRate/2]); var maximum = 0; var frequency = 0;  
function setup() {
$p.size(800, 400);

  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 4096*8, sampleRate);
  fft = new FFT(in.left.size(), sampleRate);
}
$p.setup = setup;

function draw() {
$p.background(0);  
  findNote();   
  $p.textSize(50);   
  $p.text (frequency+" hz", 50, 80);   $p.pushStyle();
  $p.fill(c);
  $p.text (""+note, 50, 150);   $p.popStyle();
}
$p.draw = draw;

function findNote() {
fft.forward(in.left);
  for (var f = 0; f<sampleRate/2; f++) {
max[f]=fft.getFreq($p.parseFloat(f));
}
  maximum=max(max);  
  for (var i = 0;  i<max.length;  i++) {
if (max[i] == maximum) {
frequency= i;
}
}

 frequency = 
   n= $p.parseInt(frequency);  
if (n==248)
  {
note = "E";
    c = $p.color (255, 0, 0);
}

if (n==221)    {
note = "A";
    c = $p.color (255, 150, 0);
}

if (n==263)    {
note = "C";
    c = $p.color (255, 255, 0);
}
if (n==131)
  {
note = "C";
    c = $p.color (255, 255, 0);
}

if (n==98)
  {
note = "G";
    c = $p.color (100, 150, 190);
}
if (n==197)
  {
note = "G";
    c = $p.color (100, 150, 190);
}
if (n==587)    {
note = "G";
    c = $p.color (100, 150, 190);
}
if (n==147)
  {
note = "G";      c = $p.color (100, 150, 190);
}

if (n==740)
  {
note = "D";
    c = $p.color (0, 150, 250);
}
}
$p.findNote = findNote;

function stop() {
in.close();
  minim.stop();

  $super.stop();
}
$p.stop = stop;
