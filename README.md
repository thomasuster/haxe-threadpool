## Thread pool library for haxe (neko or CPP)

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md)
[![TravisCI Build Status](https://travis-ci.org/thomasuster/haxe-threadpool.svg?branch=master)](https://travis-ci.org/thomasuster/haxe-threadpool)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/thomasuster/haxe-threadpool?branch=master&svg=true)](https://ci.appveyor.com/project/thomasuster/haxe-threadpool)

```
git clone https://github.com/thomasuster/haxe-threadpool.git
haxelib dev haxe-threadpool haxe-threadpool
```

## addConcurrent example
```haxe
var pool = new ThreadPool(4);
var didWork = false;
var work = function(t:Int) {
    didWork = true;
};
pool.addConcurrent(work);
pool.blockRunAll();
assertTrue(didWork);
pool.end();
```

## distributeLoop example
```haxe
var pool = new ThreadPool(4);
var source:Array<Int> = [10,20,30];
var copy:Array<Int> = [0,0,0];
pool.distributeLoop(source.length,function(t:Int, index:Int) {
    copy[index] = source[index];
});
pool.blockRunAll();
assertEquals(source.join(','), '10,20,30');
pool.end();
```

## Shared resources example
```haxe
var pool = new ThreadPool(4);
var sumM:Mutex = new Mutex();
var sum:Int = 0;
var nums:Array<Int> = [10,20,30];
pool.distributeLoop(nums.length,function(t:Int, index:Int) {
    sumM.acquire();
    sum+=nums[index];
    sumM.release();
});
pool.blockRunAll();
assertEquals(10+20+30, sum);
pool.end();
```

## Thread resource example
```haxe
var pool = new ThreadPool(2);
var threadNames = ["Tom", "Jerry"];
pool.addWork(function(t:Int) {
    Sys.println("${threadNames[t]} did the work.");
});
pool.blockRunAll();
pool.end();
```
