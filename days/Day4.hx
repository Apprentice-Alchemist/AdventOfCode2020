using StringTools;

class Day4 implements IDay {
	public final day = 4;
	public final input = Utils.getFileContent("input/day4.txt");
	public final passports:Array<Passport> = [];

	public function new() {
		var i = input.split("\n\n");
		for (x in i) {
			var p = new Passport();
			for (x1 in x.split("\n")) {
				for (x2 in x1.split(" ")) {
					p.fields.set(x2.split(":")[0], x2.split(":")[1]);
				}
			}
			passports.push(p);
		}
	}

	public function run() {
		var valid = 0;
		for (p in passports) {
			if (p.isValid(false))
				valid++;
		}
		Sys.println(' - Part 1 : $valid valid passports out of ${passports.length}');
		var valid = 0;
		for (p in passports) {
			if (p.isValid(true))
				valid++;
		}
		Sys.println(' - Part 2 : $valid valid passports out of ${passports.length}');
	}
}

private class Passport {
	static final regs = null;
	static final req_fields:Map<String, EReg> = [
		"byr" => ~/^(19[2-9][0-9]|200[0-2])$/m,
		"iyr" => ~/^20(1[0-9]|20)$/m,
		"eyr" => ~/^20(2[0-9]|30)$/m,
		"hgt" => ~/^(1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in)$/m,
		"hcl" => ~/^#[0-9a-f]{6}$/m,
		"ecl" => ~/^(amb|blu|brn|gry|grn|hzl|oth)$/m,
		"pid" => ~/^[0-9]{9}$/m
	];

	public final fields:Map<String, String> = [];

	public function new() {}

	public function isValid(check_value = false) {
		for (key => reg in req_fields) {
			if (!fields.exists(key))
				return false;
			if(check_value)
				if(!reg.match(fields.get(key)))
					return false;
		}
		return true;
	}

	public inline function toString()
		return "Passport : \n   " + [for (k => v in fields) '$k : $v'].join("\n   ");
}
