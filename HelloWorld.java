public class HelloWorld {
    public native void println(String message);
    public native int getInt();
    public native String toString(int value);

    static {
        System.loadLibrary("mynative");
    }

    public static void main(String[] args) {
        HelloWorld obj = new HelloWorld();
        obj.println("Hello JNI world");
        obj.println("");

        obj.println("Calling getInt");
        int value = obj.getInt();
        obj.println("");

        obj.println("Calling toString");
        String ret = obj.toString(value);
        obj.println(ret);
    }
}
