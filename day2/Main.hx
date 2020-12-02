package;

class Main {
	static final input = Utils.getFileContent("input/input.txt");
	static final regex = ~/(\d+)-(\d+) ([a-zA-Z]): (\w+)/g;

	static function main() {
		Sys.println("Advent of Code 2020 : Day 2");
		function check1(s:String, min:Int, max:Int, what:String):Bool {
			var count = 0;
			for (i in 0...s.length)
				if (s.charAt(i) == what)
					count++;
			return (count >= min) && (count <= max);
		}
		function check2(s:String, min:Int, max:Int, what:String):Bool {
			return (s.charAt(min - 1) == what && s.charAt(max - 1) != what) || (s.charAt(min - 1) != what && s.charAt(max - 1) == what);
		}
		var arr = input.split("\n");
		while (arr.remove(null)) {}
		var count1 = 0;
		var count2 = 0;
		for (x in arr) {
			if (regex.match(x)) {
				var min = Std.parseInt(regex.matched(1));
				var max = Std.parseInt(regex.matched(2));
				var what = regex.matched(3);
				var pw = regex.matched(4);
				if (check1(pw, min, max, what))
					count1++;
				if (check2(pw, min, max, what))
					count2++;
			} else {
				Sys.println('Invalid input : $x');
			}
		}
		Sys.println('Part 1 : $count1 valid passwords found!');
		Sys.println('Part 2 : $count2 valid passwords found!');
	}
}
