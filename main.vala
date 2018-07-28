using Gtk;

class MainProgram
{
    private static string[] args;

    private static bool saved;

    private static Window window;

    private static bool testScreen(Widget widget, Gdk.EventAny e)
    {
        var dialog = new ClosingFile(ref window);
        dialog.saveFile.connect(MainProgram.save);
        dialog.run();
        return true;
    }

    public static void save()
    {
        print("Test Save");
    }

    public static void main(string[] args)
    {
        MainProgram.args = args;
        saved = false;
        Gtk.init(ref args);

        window = new Window();

        window.title = "unixPaint";

        window.border_width = 10;
        window.window_position = WindowPosition.CENTER;
        window.set_default_size(600, 450);
        window.delete_event.connect(MainProgram.testScreen);

        var button = new Button.with_label("Click me!");
        button.clicked.connect(() =>
        {
            button.label = "Thank you!";
            saved=true;
        });

        window.add(button);
        window.show_all();

        Gtk.main();
    }
}
