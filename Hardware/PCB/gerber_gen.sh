pushd sidekickvco
kikit separate --source 'annotation; ref: B1' sidekickvco.kicad_pcb  'Separate PCBs/sidekickvco_b1.kicad_pcb'
kikit fab jlcpcb --no-drc --nametemplate "sidekickvco_b1_{}" 'Separate PCBs/sidekickvco_b1.kicad_pcb' ..
popd
mv gerbers sidekickvco_b1_gerbers
pushd sidekickvco
kikit separate --source 'annotation; ref: B2' sidekickvco.kicad_pcb  'Separate PCBs/sidekickvco_b2.kicad_pcb'
kikit fab jlcpcb --no-drc --nametemplate "sidekickvco_b2_{}" 'Separate PCBs/sidekickvco_b2.kicad_pcb' ..
popd
mv gerbers sidekickvco_b2_gerbers
