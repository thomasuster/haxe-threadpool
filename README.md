## Thread pool library for haxe (neko or CPP)

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md)
[![TravisCI Build Status](https://travis-ci.org/thomasuster/haxe-threadpool.svg?branch=master)](https://travis-ci.org/thomasuster/haxe-threadpool)

```
git clone https://github.com/thomasuster/haxe-threadpool.git
haxelib dev haxe-threadpool haxe-threadpool/src
```
```
public function testSimple() {
    var pool = new ThreadPool(4);
    var didWork:Bool = false;
    var work:Void->Void = function() {
        didWork = true;
    };
    pool.addConcurrent(work);
    pool.blockRunAll();
    assertTrue(didWork);
    pool.end();
}
```
```
public function testDistributedLoop():Void {
    var pool = new ThreadPool(4);
    var sum:Int = 0;
    pool.distributeLoop(5,function(index:Int) {
        sum+=index;
    });
    pool.blockRunAll();
    assertEquals(0+1+2+3+4, sum);
    pool.end();
}
```