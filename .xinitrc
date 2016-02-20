export LANG=zh_CN.UTF-8
export PYTHONPATH="$PYTHONPATH:/srv/pentest/nmap/lib/python2.7/site-packages/"

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
exec openbox-session
