package;

class Day1 implements IDay {
	final input = Utils.getFileContent("input/day1.txt");

	public final day = 1;

	public function new() {}

	public function run() {
		var answer1 = part1();
		if (answer1 != null)
			Sys.println(' - Part 1 : $answer1')
		else
			Sys.println(" - No answer found for Part 1");

		var answer2 = part2();
		if (answer2 != null)
			Sys.println(' - Part 2 : $answer2')
		else
			Sys.println(" - No answer found for Part 2");
	}

	function part1():Null<Int> {
		var arr = [for (x in input.split("\n")) Std.parseInt(x)];
		while (arr.remove(null)) {}
		for (x in arr) {
			for (y in arr) {
				if ((x + y) == 2020) {
					var answer = x * y;
					return answer;
				}
			}
		}
		return null;
	}

	function part2():Null<Int> {
		var arr = [for (x in input.split("\n")) Std.parseInt(x)];
		while (arr.remove(null)) {}
		for (x in arr) {
			for (y in arr) {
				for (z in arr) {
					if ((x + y + z) == 2020) {
						var answer = x * y * z;
						return answer;
					}
				}
			}
		}
		return null;
	}
}
