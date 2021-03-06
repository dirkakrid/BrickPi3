#! /bin/bash
REPO_PATH=$(readlink -f $(dirname $0) | grep -E -o "^(.*?\\BrickPi3)")
echo "Updating the BrickPi3 SAMD Firmware with '$REPO_PATH/Firmware/brickpi3_firmware.bin'."
sudo openocd -f interface/raspberrypi2-native.cfg -c "transport select swd; set CHIPNAME at91samd21j18; source [find target/at91samdXX.cfg]; adapter_khz 50; adapter_nsrst_delay 100; adapter_nsrst_assert_width 100" -c "init; targets; reset halt; program $REPO_PATH/Firmware/brickpi3_firmware.bin verify; reset" -c "shutdown"
