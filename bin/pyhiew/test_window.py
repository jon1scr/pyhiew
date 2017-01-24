import hiew

dbg = hiew.dbg

# -----------------------------------------------------------------------
def test1():
    w = hiew.Window()
    r = w.Create(
        title = "Window title",
        lines = ["Line %d" % i for i in range(0, 10)],
        width = 30,
        main_keys = {1: "Help"},
        alt_keys = {4: "Reload", 1: "AHelp"})

    while True:
        n, k = w.Show()
        dbg("n=%s k=%s\n" % (n, k))
        if n == -1:
            break

# -----------------------------------------------------------------------
def test2():
    hiew.Window.FromString("Info", "Hello\nworld\n")

# -----------------------------------------------------------------------
test2()