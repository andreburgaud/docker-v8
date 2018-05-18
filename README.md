# V8 Docker Image

* Builds the Google JavaScript V8 engine and allows to use the D8 shell
* D8 (Debug8) is V8's own minimalist debug shell (https://github.com/v8/v8/wiki/Using-D8)

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Docker Build Status](https://img.shields.io/docker/build/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)

# V8

From https://developers.google.com/v8/:

> V8 is Google’s open source high-performance JavaScript engine, written in C++ and used in Google Chrome, the open source browser from Google, and in Node.js, among others.

# Usage

## V8 Enhanced Shell

```
$ docker run --rm -it d8 shell
Starting d8 with the following parameters: --allow-natives-syntax --harmony-shipping
--harmony-do-expressions --harmony-class-fields --harmony-static-fields --harmony-array-flatten
Use quit() or Ctrl-D (i.e. EOF) to exit the d8 Shell
V8 version 6.8.0 (candidate)
d8>
```

* The default V8 shell is wrapped with `rlwrap` (https://github.com/hanslub42/rlwrap) to enhance the experience with the REPL (e.g. use arrow keys to recall previous/next lines).

* The `harmony` options are automatically injected via the `entrypoint.sh` script.

* Additional V8 options in addition to the `harmony` ones can be passed at the command line:

```
$ docker run --rm -it d8 shell --dump-counters
```

### What is Harmony?

When ECMAScript 4 (ES4) was abandoned in 2008, some of its features were rolled into a project codenamed ECMAScript Harmony. ES6 later renamed ES2015 was the first "ECMAScript Harmony" specification and is also known as "ES6 Harmony". The V8 harmony options enable specific features that may not yet be part of the default engine features.

## Help

```
$ docker run --rm -it d8 help
```

Display the commands available via the docker container.

## Default V8 Shell

```
$ docker run --rm -it d8
```

## Internal V8 help

```
$ docker run --rm -it d8 --help
```

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
