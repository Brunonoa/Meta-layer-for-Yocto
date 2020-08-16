pkg_postinst_${PN}() {
    #echo "pcm.front cards.pcm.default" >> $D/etc/asound.conf

    echo "pcm.speakerbonnet {" >> $D/etc/asound.conf
    echo "   type hw card 0" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
     
    echo "pcm.dmixer {" >> $D/etc/asound.conf
    echo "   type dmix" >> $D/etc/asound.conf
    echo "   ipc_key 1024" >> $D/etc/asound.conf
    echo "   ipc_perm 0666" >> $D/etc/asound.conf
    echo "   slave {" >> $D/etc/asound.conf
    echo "     pcm \"speakerbonnet\"" >> $D/etc/asound.conf
    echo "     period_time 0" >> $D/etc/asound.conf
    echo "     period_size 1024" >> $D/etc/asound.conf
    echo "     buffer_size 8192" >> $D/etc/asound.conf
    echo "     rate 44100" >> $D/etc/asound.conf
    echo "     channels 2" >> $D/etc/asound.conf
    echo "   }" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
     
    echo "ctl.dmixer {" >> $D/etc/asound.conf
    echo "    type hw card 0" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
     
    echo "pcm.softvol {" >> $D/etc/asound.conf
    echo "    type softvol" >> $D/etc/asound.conf
    echo "    slave.pcm \"dmixer\"" >> $D/etc/asound.conf
    echo "    control.name \"PCM\"" >> $D/etc/asound.conf
    echo "    control.card 0" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
     
    echo "ctl.softvol {" >> $D/etc/asound.conf
    echo "    type hw card 0" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
     
    echo "pcm.!default {" >> $D/etc/asound.conf
    echo "    type             plug" >> $D/etc/asound.conf
    echo "    slave.pcm       \"softvol\"" >> $D/etc/asound.conf
    echo "}" >> $D/etc/asound.conf
    echo "" >> $D/etc/asound.conf
}
