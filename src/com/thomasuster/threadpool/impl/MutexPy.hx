package com.thomasuster.threadpool.impl;

import python.lib.threading.Lock;

class MutexPy implements MutexInterface {
  var mutex : Lock = new Lock();

  public function new() {
  }

  public inline function acquire() : Void {
    mutex.acquire();
  }

  public inline function release() : Void {
    mutex.release();
  }

}
