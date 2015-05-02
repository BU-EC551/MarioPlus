
 
 
 

 



window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /solid_tb/status
      waveform add -signals /solid_tb/solid_synth_inst/bmg_port/CLKA
      waveform add -signals /solid_tb/solid_synth_inst/bmg_port/ADDRA
      waveform add -signals /solid_tb/solid_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
