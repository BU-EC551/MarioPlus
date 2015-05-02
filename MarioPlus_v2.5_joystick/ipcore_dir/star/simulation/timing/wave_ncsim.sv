
 
 
 

 



window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /star_tb/status
      waveform add -signals /star_tb/star_synth_inst/bmg_port/CLKA
      waveform add -signals /star_tb/star_synth_inst/bmg_port/ADDRA
      waveform add -signals /star_tb/star_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
