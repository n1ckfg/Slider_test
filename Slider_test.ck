// NOTE: In order to load sound files,
// choose your working directory in the preferences.
//~~~~~~~~~~~~~~~~~~~~~~
// ChucK slider test v9
// Nick Fox-Gieg

//---  SOUND SAMPLES   ---
"fg01.wav" => string sample1;
"fg02.wav" => string sample2;
"fg03.wav" => string sample3;
"fg04.wav" => string sample4;
"fg05.wav" => string sample5;
"bg01.wav" => string sample6;
"bg02.wav" => string sample7;
"bg03.wav" => string sample8;
"bg04.wav" => string sample9;
"bg05.wav" => string sample10;

//---   VARIABLES   ---
2000 => float cutoff;
0 => float startGain;
0.5 => float startVolume;
0 => float qq;
1 => float minRange;
1000 => float maxRange;
10 => float loFreq;
1000 => float hiFreq;
440 => float defaultFreq;
1 => float interval;
17 => float shift;

//---  UGENS   ---
SinOsc sine => LPF lpf1 => JCRev r1 => Gain g1 => dac;
SqrOsc square => LPF lpf2 => JCRev r2 => Gain g2 => dac;
SawOsc saw => LPF lpf3 => JCRev r3 => Gain g3 => dac;
TriOsc triangle => LPF lpf4 => JCRev r4 => Gain g4 => dac;
SndBuf buffer1 => dac;
SndBuf buffer2 => dac;
SndBuf buffer3 => dac;
SndBuf buffer4 => dac;
SndBuf buffer5 => dac;
SndBuf buffer6 => dac;
SndBuf buffer7 => dac;
SndBuf buffer8 => dac;
SndBuf buffer9 => dac;
SndBuf buffer10 => dac;

//---   SETUP   ---
sample1 => buffer1.read;
sample2 => buffer2.read;
sample3 => buffer3.read;
sample4 => buffer4.read;
sample5 => buffer5.read;
sample6 => buffer6.read;
sample7 => buffer7.read;
sample8 => buffer8.read;
sample9 => buffer9.read;
sample10 => buffer10.read;
0 => buffer1.loop;
0 => buffer2.loop;
0 => buffer3.loop;
0 => buffer4.loop;
0 => buffer5.loop;
1 => buffer6.loop;
1 => buffer7.loop;
1 => buffer8.loop;
1 => buffer9.loop;
1 => buffer10.loop;
startGain => g1.gain;
startGain => g2.gain;
startGain => g3.gain;
startGain => g4.gain;
cutoff => lpf1.freq;
cutoff => lpf2.freq;
cutoff => lpf3.freq;
cutoff => lpf4.freq;
.5 => r1.gain;
.075 => r1.mix;
.5 => r2.gain;
.075 => r2.mix;
.5 => r3.gain;
.075 => r3.mix;
.5 => r4.gain;
.075 => r4.mix;

//---   GUI   ---
MAUI_View canvas;
canvas.size(500,535);
canvas.display();

//---

canvas.addElement(MAUI_Button button1);
button1.pushType();
button1.position(0+shift, 360);
button1.name("fg 1");
button1.state(0);

canvas.addElement(MAUI_Button button2);
button2.pushType();
button2.position(75+shift, 360);
button2.name("fg 2");

canvas.addElement(MAUI_Button button3);
button3.pushType();
button3.position(150+shift, 360);
button3.name("fg 3");

canvas.addElement(MAUI_Button button4);
button4.pushType();
button4.position(225+shift, 360);
button4.name("fg 4");

canvas.addElement(MAUI_Button button5);
button5.pushType();
button5.position(300+shift, 360);
button5.name("fg 5");

canvas.addElement(MAUI_Button button6);
button6.pushType();
button6.position(375+shift, 360);
button6.name("< stop");

canvas.addElement(MAUI_Button button7);
button7.toggleType();
button7.position(0+shift, 435);
button7.name("bg 1");

canvas.addElement(MAUI_Button button8);
button8.toggleType();
button8.position(75+shift, 435);
button8.name("bg 2");

canvas.addElement(MAUI_Button button9);
button9.toggleType();
button9.position(150+shift, 435);
button9.name("bg 3");

canvas.addElement(MAUI_Button button10);
button10.toggleType();
button10.position(225+shift, 435);
button10.name("bg 4");

canvas.addElement(MAUI_Button button11);
button11.toggleType();
button11.position(300+shift, 435);
button11.name("bg 5");

canvas.addElement(MAUI_Button button12);
button12.pushType();
button12.position(375+shift, 435);
button12.name("< stop");

//---

canvas.addElement(MAUI_Slider master_volume);
master_volume.position(260, 290);
master_volume.range(0.0,1.0);
startVolume => master_volume.value;
master_volume.name("VOLUME (%)");
master_volume.displayFormat(1);

canvas.addElement(MAUI_Slider speed);
speed.position(260, 240);
speed.range(minRange,maxRange);
interval => speed.value;
speed.name("interval (ms)");
speed.displayFormat(0);

canvas.addElement(MAUI_Slider min_range);
min_range.position(0, 240);
min_range.range(minRange,maxRange);
minRange => min_range.value;
min_range.name("random minus (Hz)");
min_range.displayFormat(0);

canvas.addElement(MAUI_Slider max_range);
max_range.position(0,290);
max_range.range(minRange,maxRange);
minRange => max_range.value;
max_range.name("random plus (Hz)");
max_range.displayFormat(0);

//---

canvas.addElement(MAUI_Slider freq_sin);
freq_sin.position(0,0);
freq_sin.range(loFreq,hiFreq);
defaultFreq => freq_sin.value;
freq_sin.name("sin freq (Hz)");
freq_sin.displayFormat(0);

canvas.addElement(MAUI_Slider gain_sin);
gain_sin.position(0,50);
gain_sin.range(0.0,1.0);
startGain => gain_sin.value;
gain_sin.name("sin gain (%)");
gain_sin.displayFormat(1);

//---

canvas.addElement(MAUI_Slider freq_sqr);
freq_sqr.position(0,120);
freq_sqr.range(loFreq,hiFreq);
defaultFreq => freq_sqr.value;
freq_sqr.name("sqr freq (Hz)");
freq_sqr.displayFormat(0);

canvas.addElement(MAUI_Slider gain_sqr);
gain_sqr.position(0,170);
gain_sqr.range(0.0,1.0);
startGain => gain_sqr.value;
gain_sqr.name("sqr gain (%)");
gain_sqr.displayFormat(1);

//---

canvas.addElement(MAUI_Slider freq_saw);
freq_saw.position(260,0);
freq_saw.range(loFreq,hiFreq);
defaultFreq => freq_saw.value;
freq_saw.name("saw freq (Hz)");
freq_saw.displayFormat(0);

canvas.addElement(MAUI_Slider gain_saw);
gain_saw.position(260,50);
gain_saw.range(0.0,1.0);
startGain => gain_saw.value;
gain_saw.name("saw gain (%)");
gain_saw.displayFormat(1);

//---

canvas.addElement(MAUI_Slider freq_tri);
freq_tri.position(260,120);
freq_tri.range(loFreq,hiFreq);
defaultFreq => freq_tri.value;
freq_tri.name("tri freq (Hz)");
freq_tri.displayFormat(0);

canvas.addElement(MAUI_Slider gain_tri);
gain_tri.position(260,170);
gain_tri.range(0.0,1.0);
startGain => gain_tri.value;
gain_tri.name("tri gain (%)");
gain_tri.displayFormat(1);

//---   RUN   ---
while(true){
    max_range.value() => hiFreq;
    min_range.value() => loFreq;
    //sine
    freq_sin.value() - loFreq => qq;
    if(qq<0){0 => qq;}
    Std.rand2f(qq,(freq_sin.value() + hiFreq)) => sine.freq;
    gain_sin.value() => sine.gain;
    //sqr
    freq_sqr.value() - loFreq => qq;
    if(qq<0){0 => qq;}
    Std.rand2f(qq,(freq_sqr.value() + hiFreq)) => square.freq;
    gain_sqr.value() => square.gain;
    //saw
    freq_saw.value() - loFreq => qq;
    if(qq<0){0 => qq;}
    Std.rand2f(qq,(freq_saw.value() + hiFreq)) => saw.freq;
    gain_saw.value() => saw.gain;
    //tri
    freq_tri.value() - loFreq => qq;
    if(qq<0){0 => qq;}
    Std.rand2f(qq,(freq_tri.value() + hiFreq)) => triangle.freq;
    gain_tri.value() => triangle.gain;
    //-------
    //sampler
    if(button1.state()==1){
        1=>buffer1.rate;
    } else {
        0=>buffer1.rate;
        0=>buffer1.pos;
    }
    if(button2.state()==1){
        1=>buffer2.rate;
    } else {
        0=>buffer2.rate;
        0=>buffer2.pos;
    }
    if(button3.state()==1){
        1=>buffer3.rate;
    } else {
        0=>buffer3.rate;
        0=>buffer3.pos;
    }
    if(button4.state()==1){
        1=>buffer4.rate;
    } else {
        0=>buffer4.rate;
        0=>buffer4.pos;
    }
    if(button5.state()==1){
        1=>buffer5.rate;
    } else {
        0=>buffer5.rate;
        0=>buffer5.pos;
    }
    if(button6.state()==1){
        button1.state(0);
        button2.state(0);
        button3.state(0);
        button4.state(0);
        button5.state(0);
    }
    if(button7.state()==1){
        1=>buffer6.rate;
    } else {
        0=>buffer6.rate;
        0=>buffer6.pos;
    }
    if(button8.state()==1){
        1=>buffer7.rate;
    } else {
        0=>buffer7.rate;
        0=>buffer7.pos;
    }
    if(button9.state()==1){
        1=>buffer8.rate;
    } else {
        0=>buffer8.rate;
        0=>buffer8.pos;
    }
    if(button10.state()==1){
        1=>buffer9.rate;
    } else {
        0=>buffer9.rate;
        0=>buffer9.pos;
    }
    if(button11.state()==1){
        1=>buffer10.rate;
    } else {
        0=>buffer10.rate;
        0=>buffer10.pos;
    }
    if(button12.state()==1){
        button7.state(0);
        button8.state(0);
        button9.state(0);
        button10.state(0);
        button11.state(0);
    }
    
    //speed
    speed.value() => interval;
    //master gain
    master_volume.value() => g1.gain;
    master_volume.value() => g2.gain;
    master_volume.value() => g3.gain;
    master_volume.value() => g4.gain;
    master_volume.value() => buffer1.gain;
    master_volume.value() => buffer2.gain;
    master_volume.value() => buffer3.gain;
    master_volume.value() => buffer4.gain;
    master_volume.value() => buffer5.gain;
    master_volume.value() => buffer6.gain;
    master_volume.value() => buffer7.gain;
    master_volume.value() => buffer8.gain;
    master_volume.value() => buffer9.gain;
    master_volume.value() => buffer10.gain;
    // go!
    interval::ms => now;
}

//---   END   ---
