SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

RPI_PITFT35 ?= ""
RPI_PITFT35_ADAPTED ?= ""
RPI_PITFT24 ?= ""
RPI_PITFT24_ADAPTED ?= ""
RPI_PWM_2CHAN ?= ""
RPI_I2S_AUDIO ?= ""
RPI_SSH_USB ?= ""

do_deploy_append() {

	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "#dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "dtparam=spi=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "dtparam=i2s=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	echo "#Disable overscan for removing black border around the splash" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "disable_overscan=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	echo "hdmi_ignore_edid_audio=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "#Simula lo schermo collegato" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "hdmi_force_hotplug=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "#hdmi_ignore_hotplug=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "hdmi_force_edid_audio=0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "disable_audio_dither=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	echo "disable_splash=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "gpu_mem=128" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	if [ "${RPI_PITFT35}" = "1" ]; then
		echo "##Configuration for Waveshare3.5 Display" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

		if [ "${RPI_PITFT35_ADAPTED}" = "1" ]; then
			echo "#hdmi_cvt=480 320 60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_cvt=1360 768 60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_group=2" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_mode=87" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		fi

		echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "#For 3.5 inch display" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=waveshare35a,rotate=270,speed=32000000,fps=60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		
	fi

	if [ "${RPI_PITFT24}" = "1" ]; then
		echo "##Configuration for tft2.4 Display" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

		if [ "${RPI_PITFT24_ADAPTED}" = "1" ]; then
			echo "#hdmi_cvt=480 320 60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_cvt=1360 768 60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_group=2" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
			echo "hdmi_mode=87" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		fi

		echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "#For 2.4 inch display" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=tft24-resistive" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "#For GPIO to keyboard conversion" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=gpio-keys" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		
	fi

	if [ "${RPI_PWM_2CHAN}" = "1"]; then
		echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "#For 2 channel pwm" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=pwm-2chan" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	fi

	if [ "${RPI_I2S_AUDIO}" = "1" ]; then
		echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt		
		echo "#For audio with UDA334ATS" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=i2s-only-output" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=hifiberry-dac" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=i2s-mmap" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	fi

	if [ "${RPI_SSH_USB}" = "1" ]; then
		echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt		
		echo "#For ssh via usb" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=dwc2" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt		
	fi

	#Disable wifi and bluetooth
	echo "dtoverlay=disable-bt" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "dtoverlay=disable-wifi" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

}


#do_deploy_append() {
#    if [ -n "${ENABLE_RPI3_SERIAL_CONSOLE}" ]; then
#    	echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "## Disable RPi3 bluetooth to enable serial console on UART0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#       echo "dtoverlay=pi3-disable-bt" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#    fi
#
#	echo "##Configuration for Waveshare3.5 Display" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "hdmi_force_hotplug=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "hdmi_cvt=480 320 60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "hdmi_group=2" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "hdmi_mode=87" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#
#	echo "disable_overscan=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "dtparam=spi=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "#dtoverlay=tft35a,rotate=270,speed=32000000,fps=60" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "dtoverlay=ads7846,penirq=25,penirq_pull=2,xohms=150,swapxy=1,xmin=300,ymin=700,xmax=3800,ymax=3400,pmax=255" >> \
#	${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "dtoverlay=waveshare35a" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#	echo "gpu_mem=128" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
#}


