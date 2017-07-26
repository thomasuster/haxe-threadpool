import cpp.vm.Gc;
import com.thomasuster.spinz.Spinz;
class TestProject extends haxe.unit.TestCase {

    var spinz:Spinz;
    
    override public function setup():Void {
        spinz = new Spinz(4);
    }

    override public function tearDown():Void {
        spinz.end();
    }
    
    public function testSimple() {
        var didWork:Bool = false;
        var work:Void->Void = function(){
            didWork = true;
        };
        spinz.addConcurrent(work);
        spinz.runAll();
        assertTrue(didWork);
    }

    public function testWithMoreTasksThanThreads() {
        _testsTasks(32);
    }

    public function testOddNumberOfHighTasks() {
        _testsTasks(33);
    }

    public function testMultipleJobs() {
        _testsTasks(11);
        _testsTasks(10);
    }

    function _testsTasks(num:Int):Void {
        var didWork:Array<Float> = [];
        for (i in 0...num) {
            didWork.push(0);
        }
        for (i in 0...num) {
            spinz.addConcurrent(function() {
                didWork[i] = Sys.time();
            });
        }
        spinz.runAll();
        var now:Float = Sys.time();
        for (i in 0...num)
            assertTrue(didWork[i] <= now);
    }
}