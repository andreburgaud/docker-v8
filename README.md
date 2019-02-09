# V8 Docker Image

* Builds the Google JavaScript V8 engine and allows to use the D8 shell
* D8 (Debug8) is V8's own minimalist debug shell (https://github.com/v8/v8/wiki/Using-D8)

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/d8.svg)](https://hub.docker.com/r/andreburgaud/d8/)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/d8.svg)](https://microbadger.com/images/andreburgaud/d8)

![docker_v8_7 3 255](https://user-images.githubusercontent.com/6396088/50544208-e4f7b000-0bb3-11e9-9c40-b256180b140a.png)

# V8

From https://developers.google.com/v8/:

> V8 is Google’s open source high-performance JavaScript engine, written in C++ and used in Google Chrome, the open source browser from Google, and in Node.js, among others.

# Usage

```
$ docker pull andreburgaud/d8
```

## V8 Enhanced Shell

```
$ docker run --rm -it andreburgaud/d8 shell
Options: --harmony --harmony-shipping --harmony-class-fields --harmony-private-methods
--harmony-regexp-sequence --harmony-weak-refs --harmony-intl-bigint
--harmony-intl-datetime-style --harmony-locale --harmony-private-fields
--harmony-numeric-separator --harmony-hashbang --harmony-intl-segmenter
--harmony-namespace-exports --harmony-sharedarraybuffer --harmony-import-meta
--harmony-dynamic-import --harmony-symbol-description --harmony-global
--harmony-json-stringify --harmony-public-fields --harmony-static-fields
--harmony-string-matchall --harmony-object-from-entries --harmony-await-optimization
--harmony-intl-list-format
Use quit() or Ctrl-D (i.e. EOF) to exit the D8 Shell
V8 version 7.4.120
d8>
```

* The default V8 shell is wrapped with `rlwrap` (https://github.com/hanslub42/rlwrap) to enhance the experience with the REPL (e.g. use arrow keys to recall previous/next lines).

* The `harmony` options are automatically injected via the `entrypoint.sh` script.

* Additional V8 options in addition to the `harmony` ones can be passed at the command line:

```
$ docker run --rm -it andreburgaud/d8 shell --dump-counters
```

### Using Multiline

When starting the d8 container with command `shell`, as follow:

```
$ docker run --rm -it andreburgaud/d8 shell
```

You also have the ability to write statements across several lines, by ending lines with a `\` (backslash):

```
d8> function f(n) { \
    print(n); \
}
undefined
d8> f('TEST');
TEST
undefined
d8>
```

### What is Harmony?

When ECMAScript 4 (ES4) was abandoned in 2008, some of its features were rolled into a project codenamed ECMAScript Harmony. ES6 later renamed ES2015 was the first "ECMAScript Harmony" specification and is also known as "ES6 Harmony". The V8 harmony options enable specific features that may not yet be part of the default engine features.


### Harmony Flags with Version 7.4.120

The following flags are enabled when executing the shell `docker run --rm -it andreburgaud/d8:7.3.255 shell`:


```
--harmony (enable all completed harmony features)
--harmony-shipping (enable all shipped harmony features)
--harmony-class-fields (enable "harmony fields in class literals" (in progress))
--harmony-private-methods (enable "harmony private methods in class literals" (in progress))
--harmony-regexp-sequence (enable "RegExp Unicode sequence properties" (in progress))
--harmony-weak-refs (enable "harmony weak references" (in progress))
--harmony-intl-bigint (enable "BigInt.prototype.toLocaleString" (in progress))
--harmony-intl-datetime-style (enable "dateStyle timeStyle for DateTimeFormat" (in progress))
--harmony-locale (enable "Intl.Locale" (in progress))
--harmony-private-fields (enable "harmony private fields in class literals")
--harmony-numeric-separator (enable "harmony numeric separator between digits")
--harmony-hashbang (enable "harmony hashbang syntax")
--harmony-intl-segmenter (enable "Intl.Segmenter")
--harmony-namespace-exports (enable "harmony namespace exports (export * as foo from 'bar')")
--harmony-sharedarraybuffer (enable "harmony sharedarraybuffer")
--harmony-import-meta (enable "harmony import.meta property")
--harmony-dynamic-import (enable "harmony dynamic import")
--harmony-symbol-description (enable "harmony Symbol.prototype.description")
--harmony-global (enable "harmony global")
--harmony-json-stringify (enable "well-formed JSON.stringify")
--harmony-public-fields (enable "harmony public instance fields in class literals")
--harmony-static-fields (enable "harmony static fields in class literals")
--harmony-string-matchall (enable "harmony String.prototype.matchAll")
--harmony-object-from-entries (enable "harmony Object.fromEntries()")
--harmony-await-optimization (enable "harmony await taking 1 tick")
--harmony-intl-list-format (enable "Intl.ListFormat")
```

## Help

```
$ docker run --rm -it andreburgaud/d8 help
```

Display the commands available via the docker container.

## Default V8 Shell

```
$ docker run --rm -it andreburgaud/d8
```

## Internal V8 help

```
$ docker run --rm -it andreburgaud/d8 --help
```

## Start D8 with custom options

```
$ docker run --rm -it andreburgaud/d8 --dump-counters
```

## Executing a JavaScript file

Assuming that the following `hello.js` file is in the folder `examples` of your current working directory:

```javascript
console.log('Hello World!');
```

Execute:

```
docker run --rm -it -v $PWD/examples:/examples/ andreburgaud/d8 /examples/hello.js
Hello World!
```

# Build Local Image

```
$ git clone https://github.com/andreburgaud/docker-v8.git
$ cd docker-v8
$ docker build -t d8 .
```

**Note**: the compilation may take some time depending on your hardware. For example it takes about 30 minutes on a 3.5GHz four core iMac with 24GB of RAM.

# Resources

* https://github.com/v8/v8
* https://github.com/v8/v8/wiki
* https://github.com/v8/v8/wiki/Building-with-GN
* https://en.wikipedia.org/wiki/ECMAScript

# MIT License

See the license file
