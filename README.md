# safetymode
A Magisk Module to enable or disable Magisk Core Only Mode during the early boot phase by rapidly pressing the volume up / down buttons.

# Tutorial
During the early bootup phase on your device (before the boot animation even begins), rapidly press the volume up button. After a short while, your device should reboot automatically in Magisk Core Only Mode.

Once you are booted, remove any offending Magisk Modules from the Magisk Manager app. Then enter the Magisk Manager settings and disable Core Only mode, and reboot. Alternatively, you can rapidly press volume down while booting to disable Magisk Core Only Mode during the early bootup phase, perhaps for devices that depend on Magisk Modules to boot (Micro GApps).

# Caveats
Since this module uses a post-fs-data.sh script, your device may take longer than usual to bootup normally. This is because the safetymode module is polling for volume presses in case it needs to rescue your device.
