
// Dubious Toppings - by Joo Won Park (www.joowonpark.net)
// How to run DubiousToppings.scd
// 1. Open this file in SuperCollider (if not installed already, download the program from https://supercollider.github.io/download )
// 2. From Menu, select  Language->Evaluate File. A screen where you can type letters will pop up. If you hear sounds, you are ready
// 3. When done, close the text window
//

s.waitForBoot{

	SynthDef("Click",{
		arg freq =60, amp=0.5,dur=0.5,pan=0,cut=200;
		var sound,lfo,mix;

		//lfo= LFPulse.ar(rate,0.5,mul:freq.midicps);
		sound = WhiteNoise.ar(amp);
		sound = HPF.ar(sound,cut);
		sound = sound*(XLine.ar(1,0.00001,dur,doneAction:2));

		mix =Pan2.ar(sound,pan);

		Out.ar (0,mix*amp);
	}).add;

	SynthDef("Ting",{
		arg amp, freq,dur,cut;
		var sound,env,mix;
		sound =Saw.ar([freq.midicps,(freq+0.02).midicps]);
		env=XLine.ar(1,0.0001,dur,doneAction:2);
		mix = sound*env*amp;
		Out.ar(0,mix);

	}).add;


	~key=60;

	~click={
		arg amp,dur, cut;
		Synth("Click",[\amp,amp,\dur,dur,\cut,cut])
	};

	~beep={
		arg amp,freq,dur,cut;
		Synth("Ting",[\amp,amp,\freq,freq,\dur,dur,\cut,cut]);
	};

	~qd={~click.value(0.9,0.07+0.01.rand,1800+200.rand)};
	~qu={~click.value(0.9,0.05+0.01.rand,2500+100.rand)};
	~ad={~click.value(0.7,0.07+0.01.rand,1000+100.rand)};
	~au={~click.value(0.7,0.06+0.01.rand,1400+200.rand)};
	~zd={~click.value(0.6,0.07+0.02.rand,600+50.rand)};
	~zu={~click.value(0.6,0.05+0.02.rand,800+100.rand)};

	~nd={~beep.value(0.4+0.05.rand,~key+[0,2,4,5,7,9,10].choose+[-12,0,12,24].choose,2+1.5.rand,1800+200.rand)};
	~nu={~beep.value(0.05+0.4.rand,~key+[0,2,4,5,7,9,10].choose+[0,12,24,36].choose,2+1.0.rand,1800+200.rand)};

	~otherd={~click.value(0.5,0.07,100+10.rand)};
	~otheru={~click.value(0.5,0.07,150+20.rand)};

	~moused={~click.value(0.8,0.03,5000+500.rand)};
	~mouseu={~click.value(0.8,0.03,8000+800.rand)};

	//~qp.value
	//~qd.value


	~hor=Window.screenBounds.width;
	~ver=Window.screenBounds.height*0.9;
	~thegui=Window("Type In This Window", Rect(20,20, ~hor,~ver)).front;

	~thetext=TextField(~thegui, Rect(10, 10, ~hor*0.98,~ver*0.98));
	~thetext.font=Font("Times", 180);
	~thetext.background=Color(0,0,0);
	~thetext.keyDownAction = {
		arg view, char, modifiers, unicode, keycode;
		var notefreq;
		{~thetext.background=Color(2.rand,2.rand,1)}.defer;
		//{~thetext.background=Color(0,0,0)}.defer;
		{~thetext.font=Font("Times", [40,160,300,100,232,600].choose)}.defer;
		//[char,modifiers, unicode].postln;
		switch (unicode,
			//QWERTY
			113,{~qd.value},119,{~qd.value},101,{~qd.value},114,{~qd.value},116,{~qd.value},
			121,{~qd.value},117,{~qd.value},105,{~qd.value},111,{~qd.value},112,{~qd.value},
			91,{~qd.value},93,{~qd.value},
			//ASDF
			97,{~ad.value},115,{~ad.value},100,{~ad.value},102,{~ad.value},103,{~ad.value},
			104,{~ad.value},106,{~ad.value},107,{~ad.value},108,{~ad.value},59,{~ad.value},39,{~ad.value},
			//ZXCV
			122,{~zd.value},120,{~zd.value},99,{~zd.value},118,{~zd.value},98,{~zd.value},
			110,{~zd.value},109,{~zd.value},44,{~zd.value},46,{~zd.value},47,{~zd.value},
			//num
			48,{~nd.value},49,{~nd.value},50,{~nd.value},51,{~nd.value},52,{~nd.value},53,{~nd.value},
			54,{~nd.value},55,{~nd.value},56,{~nd.value},57,{~nd.value},
			//other
			{~otherd.value}
	)};
	~thetext.keyUpAction = {
		arg view, char, modifiers, unicode, keycode;
		var notefreq;
		{~thetext.background=Color(0,0,0)}.defer;
		//{~thetext.background=Color(2.rand,2.rand,1)}.defer;
		//[char,modifiers, unicode].postln;
		switch (unicode,
			//QWERTY
			113,{~qu.value},119,{~qu.value},101,{~qu.value},114,{~qu.value},116,{~qu.value},
			121,{~qu.value},117,{~qu.value},105,{~qu.value},111,{~qu.value},112,{~qu.value},
			91,{~qu.value},93,{~qu.value},
			//ASDF
			97,{~au.value},115,{~au.value},100,{~au.value},102,{~au.value},103,{~au.value},
			104,{~au.value},106,{~au.value},107,{~au.value},108,{~au.value},59,{~au.value},39,{~au.value},
			//ZXCV
			122,{~zu.value},120,{~zu.value},99,{~zu.value},118,{~zu.value},98,{~zu.value},
			110,{~zu.value},109,{~zu.value},44,{~zu.value},46,{~zu.value},47,{~zu.value},
			//num
			48,{~nu.value},49,{~nu.value},50,{~nu.value},51,{~nu.value},52,{~nu.value},53,{~nu.value},
			54,{~nu.value},55,{~nu.value},56,{~nu.value},57,{~nu.value},
			//other
			{~otheru.value}
	)};

	~thetext.mouseDownAction={
		{~thetext.background=Color(2.rand,2.rand,1)}.defer;
		~moused.value;
	};

	~thetext.mouseUpAction={
		{~thetext.background=Color(0,0,0)}.defer;
		~mouseu.value;
	};


}
