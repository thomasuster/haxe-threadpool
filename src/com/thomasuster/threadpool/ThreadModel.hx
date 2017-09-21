package com.thomasuster.threadpool;
#if cpp
import com.thomasuster.threadpool.impl.MutexCpp;
#elseif neko
import com.thomasuster.threadpool.impl.MutexN;
#elseif java
import com.thomasuster.threadpool.impl.MutexJ;
#elseif cs
import com.thomasuster.threadpool.impl.MutexCs;
#elseif python
import com.thomasuster.threadpool.impl.MutexPy;
#end
class ThreadModel {
    public var id:Int;
    public var start:Int;
    public var end:Int;
    public var mutex:MutexInterface;
    public var pending:Bool;
    public var done:Bool;

    public function new():Void {
      #if cs
      mutex = new MutexCs();
      #elseif python
      mutex = new MutexPy();
      #elseif cpp
      mutex = new MutexCpp();
      #elseif java
      mutex = new MutexJ();
      #elseif neko
      mutex = new MutexN();
      #end
    }
}
