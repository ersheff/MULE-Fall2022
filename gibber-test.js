Admin stuf

Clock.bpm = 90



OG Sample track

 samp1 = Freesound({				
	query: 'atari -loop',		//search for a specific term try to be vague and keep in mind what 								
							//people sample. Add '+' to add multiple terms, use “-“ to remove results
	sort: 'downloads',			//sort by downloads, easiest option leads to highest quality sounds
	max: 2,					//max sound length
	count: 5					//get 5 sounds
})

samp1.rate.seq( [1,2,2,1], [1, 1/2] )
samp1.trigger.seq( 1, 1/2 )
samp1.pan = gen( .5 + cycle(.25) * .45 )

samp1.pick.seq( Rndi(0, samp1.length) ) 

//OG Drum Sample Track

dsamp1 = Freesound({ 
  query:'drums +90 +bpm', // search for drums, 90, and bpm
  max:5, 							    // max of five seconds in length
  single:false, 							// files do not have to contain single sounds / notes
  filename:false,  						 // do not require query terms to be present in filename
  Count:5,								// load five samples...
  maxVoices:1							// ... but only play one at a time
})
dsamp1.pick.seq( Rndi(0,dsamp1.length), 1 )
dsamp1.trigger.seq( 1,1 )

//Sample Track 2 + reverb

 samp2 = Freesound({				
	query: 'siren -loop',		//search for a specific term try to be vague and keep in mind what 								
							//people sample. Add '+' to add multiple terms, use “-“ to remove results
	sort: 'downloads',			//sort by downloads, easiest option leads to highest quality sounds
	max: 2,					//max sound length
	count: 5					//get 5 sounds
})
.fx.add(Freeverb( ))

samp2.rate.seq( [1,2,2,1], [1, 1/2] )
samp2.trigger.seq( 1, 1/2 )
samp2.pan = gen( .5 + cycle(.25) * .45 )

samp2.pick.seq( Rndi(0, samp2.length) ) 

//Sample Track 3 + delay fx

 samp3 = Freesound({				
	query: 'forest -loop',		//search for a specific term try to be vague and keep in mind what 								
							//people sample. Add '+' to add multiple terms, use “-“ to remove results
	sort: 'downloads',			//sort by downloads, easiest option leads to highest quality sounds
	max: 8,					//max sound length
	count: 5					//get 5 sounds
})
.fx.add( Delay({ time:1/16, feedback:.15 }) )

samp3.rate.seq( [1,2,2,1], [1, 1/2] )
samp3.trigger.seq( 1, 1/2 )
samp3.pan = gen( .5 + cycle(.25) * .45 )

samp3.pick.seq( Rndi(0, samp3.length) ) 

//Drum Sample Track 2


dsamp2 = Freesound({ 
  query:'drums +90 +bpm', // search for drums, 90, and bpm
  max:5, 							    // max of five seconds in length
  single:false, 							// files do not have to contain single sounds / notes
  filename:false,  						 // do not require query terms to be present in filename
  Count:5,								// load five samples...
  maxVoices:1							// ... but only play one at a time
})
dsamp2.pick.seq( Rndi(0,dsamp2.length), 1 )     //picks random sample from pulled 0-however many you pulled
Dsamp2.rate = .25
dsamp2.trigger.seq( 1,1 )