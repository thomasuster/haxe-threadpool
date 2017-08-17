import com.thomasuster.threadpool.ThreadPool;
class TestPool extends haxe.unit.TestCase {

    var pool:ThreadPool;
    
    override public function setup():Void {
        pool = new ThreadPool(4);
    }

    override public function tearDown():Void {
        pool.end();
    }
    
    public function testSimple() {
        var didWork:Bool = false;
        var work:Int->Void = function(t:Int) {
            didWork = true;
        };
        pool.addConcurrent(work);
        pool.blockRunAll();
        assertTrue(didWork);
    }

    public function testRerunning() {
        var didWork:Int = 0;
        pool.addConcurrent(function(t:Int) {
            didWork+=10;
        });
        pool.blockRunAll();
        pool.addConcurrent(function(t:Int) {
            didWork*=10;
        });
        pool.blockRunAll();
        assertEquals(100, didWork);
    }

    public function testDistributedLoop():Void {
        var source:Array<Int> = [10,20,30];
        var copy:Array<Int> = [0,0,0];
        pool.distributeLoop(source.length,function(t:Int, index:Int) {
            copy[index] = source[index];
        });
        pool.blockRunAll();
        assertEquals(source.join(','), '10,20,30');
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
            pool.addConcurrent(function(t:Int) {
                didWork[i] = Sys.time();
            });
        }
        pool.blockRunAll();
        var now:Float = Sys.time();
        for (i in 0...num)
            assertTrue(didWork[i] <= now);
    }
}