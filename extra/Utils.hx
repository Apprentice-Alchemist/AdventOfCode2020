package;

class Utils {
    public static macro function getFileContent(path:String):haxe.macro.Expr.ExprOf<String> {
        var p = haxe.macro.Context.resolvePath(path);
        var c = sys.io.File.getContent(p);
        return macro $v{c};
    }
}