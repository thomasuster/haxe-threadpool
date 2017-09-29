package com.thomasuster.threadpool.impl;

import cs.system.threading.Mutex;

class MutexCs implements MutexInterface {
  var mutex : Mutex = new Mutex();

  public function new() {
  }

  public inline function acquire() : Void {
    mutex.WaitOne();
  }

  public inline function release() : Void {
    mutex.ReleaseMutex();
  }

}
