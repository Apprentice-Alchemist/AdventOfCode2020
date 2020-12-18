class Day3 implements IDay {
	public final input = Utils.getFileContent("input/day3.txt");
	public final day = 3;
	public final map:Array<Array<Bool>>;
	public final lines:Array<String>;
	public final width:Int;
	public final height:Int;

	public inline function get(x, y) // return map[y][x];
		return lines[y].charAt(x) == "#";

	public inline function getString(x, y)
		return get(x, y) ? "#" : ".";

	public function new() {
		lines = input.split("\n");
		var a2 = [for (x in lines) x.split("")];
		map = [for (x1 in a2) [for (x2 in x1) x2 == "#" ? true : false]];
		width = map[0].length;
		height = map.length;
	}

	public function countTrees(slopeX:Int, slopeY:Int) {
		var x = 0;
		var y = 0;
		var tree_count = 0;
		while (y < height) {
			if (x >= width)
				x -= width;
			if (get(x, y))
				tree_count++;
			x += slopeX;
			y += slopeY;
		}
		return tree_count;
	}

	public function run() {
		{
			var trees = countTrees(3, 1);
			Sys.println(' - Part 1 : $trees trees');
		} {
			var trees:haxe.Int64 = 1;
			trees *= countTrees(1, 1);
			trees *= countTrees(3, 1);
			trees *= countTrees(5, 1);
			trees *= countTrees(7, 1);
			trees *= countTrees(1, 2);
			Sys.println(' - Part 2 : $trees trees');
		}
	}
}
