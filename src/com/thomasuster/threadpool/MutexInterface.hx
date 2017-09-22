package com.thomasuster.threadpool;

interface MutexInterface {
  public function acquire() : Void;
  public function release() : Void;
}
