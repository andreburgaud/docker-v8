# V8 Docker Image

* Builds the Google JavaScript V8 engine and allows to use the D8 shell
* D8 (Debug8) is V8's own minimalist debug shell (https://github.com/v8/v8/wiki/Using-D8)

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Docker Automated Build](https://img.shields.io/docker/automated/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Docker Build Status](https://img.shields.io/docker/build/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)

# V8

From https://developers.google.com/v8/:

> V8 is Google’s open source high-performance JavaScript engine, written in C++ and used in Google Chrome, the open source browser from Google, and in Node.js, among others.

# Usage

## Start D8 shell with no specific options

```
$ docker run --rm -it d8
```

## Display D8 help

```
$ docker run --rm -it d8 --help
```

## Start D8 shell

When starting D8 with the shell command, all the `harmony` options are automatically injected via the `entrypoint.sh` script. The `harmony` options are displayed in the terminal:

```
$ docker run --rm -it d8 shell
Starting d8 with the following parameters: --allow-natives-syntax --harmony-shipping
--harmony-do-expressions --harmony-class-fields --harmony-static-fields --harmony-array-flatten
Use quit() or Ctrl-D (i.e. EOF) to exit the d8 Shell
V8 version 6.8.0 (candidate)
d8>
```

### Why Harmony?

When ECMAScript 4 (ES4) was abandoned in 2008, some of its features were rolled into a project codenamed ECMAScript Harmony. ES6 later renamed ES2015 was the first "ECMAScript Harmony" specification and is also known as "ES6 Harmony".

## Start D8 with custom options

```
$ docker run --rm -it d8 --dump-counters
```

## Executing a JavaScript file

Assuming that the following `hello.js` file is in the folder `examples` of your current working directory:

```javascript
console.log('Hello World!');
```

Execute:

```
docker run --rm -it -v $(PWD)/examples:/examples/ d8 /examples/hello.js
Hello World!
```

# Build Container Image

```
$ docker build -t d8 .
```

# Resources

* https://github.com/v8/v8
* https://github.com/v8/v8/wiki
* https://github.com/v8/v8/wiki/Building-with-GN
* https://en.wikipedia.org/wiki/ECMAScript

# MIT License

See the license file
