install:
	mkdir build
	cp -rf ../build/ ./
clean:
	rm -rf build fonts bower_components images stylesheets
html: src clean install
	jade src/application.jade -o build/

