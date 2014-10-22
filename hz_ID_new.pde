import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioInput in;
FFT fft;
String note;// name of the note
int n;//int value midi note
color c;//color
// float hertz;//frequency in hertz
//float midi;//float midi note
//int noteNumber;//variable for the midi note
 
 
int sampleRate= 44100;//sapleRate of 44100
 
float [] max= new float [sampleRate/2];//array that contains the half of the sampleRate size, because FFT only reads the half of the sampleRate frequency. This array will be filled with amplitude values.
float maximum;//the maximum amplitude of the max array
float frequency;//the frequency in hertz
 
void setup()
{
  size(800, 400);
 
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 4096*8, sampleRate);
  fft = new FFT(in.left.size(), sampleRate);
}
 
void draw()
{
 
  background(0);//black BG
 
  findNote(); //find note function
 
  textSize(50); //size of the text
 
  text (frequency+" hz", 50, 80);//display the frequency in hertz
  pushStyle();
  fill(c);
  text (""+note, 50, 150);//display the note name
  popStyle();
}
 
void findNote() {
 
  fft.forward(in.left);
  for (int f=0;f<sampleRate/2;f++) { //analyses the amplitude of each frequency analysed, between 0 and 22050 hertz
    max[f]=fft.getFreq(float(f)); //each index is correspondent to a frequency and contains the amplitude value 
  }
  maximum=max(max);//get the maximum value of the max array in order to find the peak of volume
 
  for (int i=0; i<max.length; i++) {// read each frequency in order to compare with the peak of volume
    if (max[i] == maximum) {//if the value is equal to the amplitude of the peak, get the index of the array, which corresponds to the frequency
      frequency= i;
    }
  }
 
 frequency = 
//  midi= 69+12*(log((frequency)/440));// formula that transform frequency to midi numbers
  n= int (frequency);//cast to int
 
if (n==248)
  {
    note = "E";
    c = color (255, 0, 0);
  }

if (n==221) // 220
  {
    note = "A";
    c = color (255, 150, 0);
  }
 
if (n==263) //264, 131
  {
    note = "C";
    c = color (255, 255, 0);
  }
if (n==131)
  {
    note = "C";
    c = color (255, 255, 0);
  }


if (n==98)
  {
    note = "G";
    c = color (100, 150, 190);
  }
if (n==197)
  {
    note = "G";
    c = color (100, 150, 190);
  }
if (n==587) // 588
  {
    note = "G";
    c = color (100, 150, 190);
  }
if (n==147)
  {
    note = "G"; // this one reads as G - but is the open D string
    c = color (100, 150, 190);
  }


if (n==740)
  {
    note = "D";
    c = color (0, 150, 250);
  }
  
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}
