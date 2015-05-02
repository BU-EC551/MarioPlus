

 
 
 

 



window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /cuba2_tb/status
      waveform add -signals /cuba2_tb/cuba2_synth_inst/bmg_port/CLKA
      waveform add -signals /cuba2_tb/cuba2_synth_inst/bmg_port/ADDRA
      waveform add -signals /cuba2_tb/cuba2_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
