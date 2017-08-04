import haxe.unit.TestRunner;
class TestMain {

    static function main() {
        var runner:TestRunner = new TestRunner();
        runner.add(new TestPool());
        if(runner.run())
            Sys.exit(0);
        Sys.exit(1);
    }

}