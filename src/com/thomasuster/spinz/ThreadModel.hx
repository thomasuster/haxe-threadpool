package com.thomasuster.spinz;
#if cpp
import cpp.vm.Mutex;
#else
import neko.vm.Mutex;
#end
class ThreadModel {
    public var start:Int;
    public var end:Int;
    public var mutex:Mutex;
    public var done:Bool;

    public function new():Void {
        mutex = new Mutex();
    }
}