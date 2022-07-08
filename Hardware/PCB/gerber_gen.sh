pushd sidekickvco
kikit separate --source 'rectangle; tlx: 90mm; tly: 30mm; brx: 190mm; bry: 200mm' 'sidekickvco.kicad_pcb' 'Separate PCBs/sidekickvco_b1.kicad_pcb'
kikit fab jlcpcb --no-drc --nametemplate "sidekickvco_b1_{}" 'Separate PCBs/sidekickvco_b1.kicad_pcb' ..
popd
mv gerber sidekickvco_b1_gerbers
#pushd sidekickvco
#kikit separate --source 'annotation; ref: B2' sidekickvco.kicad_pcb  'Separate #PCBs/sidekickvco_b2.kicad_pcb'
#kikit fab jlcpcb --no-drc --nametemplate "sidekickvco_b2_{}" 'Separate PCBs/sid#ekickvco_b2.kicad_pcb' ..
#popd
#mv gerber sidekickvco_b2_gerbers
