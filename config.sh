AUTOMOUNT=true
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false
print_modname() {
  ui_print "***********************************"
  ui_print "* Huawei Honor 4X Modified Module *"
  ui_print "* For any hi6210sft EMUI 4 Device *"
  ui_print "*          By MlgmXyysd.          *"
  ui_print "*     QQ Chat Group 855219808     *"
  ui_print "***********************************"
}
REPLACE="
"
set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}
drm() {
  if [ -d /sbin/.magisk ]; 
  then
    local mirror=/sbin/.magisk/mirror
  else
    local mirror=/sbin/.core/mirror
  fi
  ui_print "- Magisk mirror found at $mirror."
  local so=liboemcrypto.so
  for part in system vendor; do
    for libdir in lib lib64; do
      if [ -s $mirror/$part/$libdir/$so ]; then
	    size=$(ls -l $mirror/$part/$libdir/$so | awk '{print $5}')
        ui_print "- Found $so, which is $size bytes."
        ui_print "- Removing..."
		if [ $part = vendor ]; then
		  instdir=system/vendor
		else
		  instdir=$part
		fi
		mkdir -p $MODPATH/$instdir/$libdir 2>/dev/null
		touch $MODPATH/$instdir/$libdir/$so
      fi
    done
  done
}
