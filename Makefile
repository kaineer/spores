NAME=spore
LOCAL_BIN=${HOME}/bin
BIN=${LOCAL_BIN}/${NAME}

install:
	@date "+%H:%M:%S"
	@echo " [INFO ] Install spore script"
	mkdir -p ${LOCAL_BIN}
	ln -s ${PWD}/bin/${NAME} ${BIN}
	chmod 755 ${BIN}

remove:
	rm -f ${BIN}
