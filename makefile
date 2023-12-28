SOURCES = src/*.cpp
HEADERS = src/*.hpp
LIBS = libs/*.a


build/main.html: ${SOURCES} ${HEADERS}
	mkdir -p build
	emcc       \
		--shell-file shell.html \
		-sMIN_WEBGL_VERSION=2   \
		-sMAX_WEBGL_VERSION=2   \
		-sUSE_GLFW=3            \
		${SOURCES}              \
		${LIBS}                 \
		-o build/index.html


bench:
	mkdir -p build
	for source in ${SOURCES}; do \
	  echo $${source};           \
	  emcc                       \
	    -c                       \
	    $${source}               \
	    -o build/tmp.o;          \
	done

clean:
	rm -rf build
