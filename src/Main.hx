import haxe.macro.Expr.TypePath;

class Main {
	static macro function getDays():haxe.macro.Expr.ExprOf<Array<IDay>> {
		var p = haxe.macro.Context.resolvePath("days");
		var files = sys.FileSystem.readDirectory(p);
		var arr = [
			for (x in files) {
				var tp = new haxe.io.Path(x).file;
				var tpath:TypePath = {
					pack: [],
					name: tp
				};
				macro new $tpath();
			}
		];
		return macro $a{arr};
	}

	public static function main() {
		Sys.println("Advent of Code 2020");
		var days:Array<IDay> = getDays();
		days.sort((x, y) -> x.day > y.day ? 1 : (x.day < y.day ? -1 : 0));
		var args = Sys.args();
		if (args.length > 0) {
			final day = Std.parseInt(args[0]) - 1;
			Sys.println('\nDay ${day + 1} : ');
			days[day].run();
		} else {
			for (x in days) {
				Sys.println('\nDay ${x.day}');
				x.run();
			}
		}
	}
}
