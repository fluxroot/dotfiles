if [ "`uname`" \> "MINGW" ]; then
    echo "Detected MSYS."
	export SYSTEMPATH="/c"

	export GROOVY_HOME="${SYSTEMPATH}/Programs/groovy-2.1.3"
	export GRAILS_HOME="${SYSTEMPATH}/Programs/grails-2.2.2"
	export PHANTOMJS_BIN="${HOME}/AppData/Roaming/npm/node_modules/phantomjs/lib/phantom/phantomjs.exe"

	PATH=${PATH}:${SYSTEMPATH}/Programs/jdk-1.7.0-40/bin
	PATH=${PATH}:"${SYSTEMPATH}/Program Files (x86)/Git/cmd"
	PATH=${PATH}:"${SYSTEMPATH}/Program Files/SlikSvn/bin"
	PATH=${PATH}:"${SYSTEMPATH}/Program Files/nodejs/":${HOME}/AppData/Roaming/npm
	PATH=${PATH}:${GROOVY_HOME}/bin
	PATH=${PATH}:${GRAILS_HOME}/bin
	PATH=${PATH}:${SYSTEMPATH}/Programs/perl/c/bin:${SYSTEMPATH}/Programs/perl/perl/site/bin:${SYSTEMPATH}/Programs/perl/perl/bin
	PATH=${PATH}:${SYSTEMPATH}/Programs/python-3.3:${SYSTEMPATH}/Programs/python-3.3/Scripts
	export PATH
elif [ "`uname`" \> "CYGWIN" ]; then
	echo "Detected Cygwin."
	export SYSTEMPATH="/cygdrive/c"

	PATH=${PATH}:${SYSTEMPATH}/Programs/jdk-1.7.0-40/bin
	export PATH

	eval $(/usr/bin/ssh-pageant -ra $TEMP/.ssh-pageant)
fi

PS1='[\[\e[1;33m\]$?\[\e[m\]] \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi
