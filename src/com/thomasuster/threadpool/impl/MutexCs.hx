package com.thomasuster.threadpool.impl;

import cs.system.threading.WaitHandle;

class MutexCs extends WaitHandle implements MutexInterface {

  public function new() {
    super();
  }

  public inline function acquire() : Void {
    this.WaitOne();
  }

  public inline function release() : Void {
    this.Close();
  }

}
