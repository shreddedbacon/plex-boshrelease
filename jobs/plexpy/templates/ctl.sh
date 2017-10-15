#!/bin/bash
#
### BEGIN INIT INFO
# Provides:          PlexPy 
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts PlexPy 
# Description:       starts PlexPy
### END INIT INFO

# Source function library.
# /etc/init.d/functions

## Variables
prog=plexpy
lockfile=/var/vcap/sys/run/$prog
homedir=/var/vcap/packages/plexpy
datadir=/var/vcap/store/plexpy
configfile=/var/vcap/store/plexpy/config.ini
pidfile=/var/vcap/sys/run/plexpy.pid
nice=
# The following line must point to your Python 2.7 install
#python27=/usr/src/Python-2.7.11/python
python27=/usr/bin/python
##

options=" --daemon --config $configfile --pidfile $pidfile --datadir $datadir --nolaunch"

start() {
        # Start daemon.
        echo -n $"Starting $prog: "
        #daemon --pidfile=$pidfile $nice $python27 $homedir/PlexPy.py "$options"
        $python27 $homedir/PlexPy.py $options &
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && touch $lockfile
        return $RETVAL
}

stop() {
        echo -n $"Shutting down $prog: "
        kill -9 $(cat $pidfile)
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && rm -f $lockfile
	rm $pidfile
        return $RETVAL
}

# See how we were called.
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status $prog
        ;;
  restart|force-reload)
        stop
        start
        ;;
  try-restart|condrestart)
        if status $prog > /dev/null; then
            stop
            start
        fi
        ;;
  reload)
        exit 3
        ;;
  *)
        echo $"Usage: $0 {start|stop|status|restart|try-restart|force-reload}"
        exit 2
esac
