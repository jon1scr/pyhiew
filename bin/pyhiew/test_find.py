import hiew

dbg = hiew.dbg

# -----------------------------------------------------------------------
def test1():
    while True:
        r = hiew.Find(flags = 0, offset = 0, data = "\xCC\xCC")
        hiew.Message("First", str(r))
        if not r:
            break

        r = hiew.FindNext()
        hiew.Message("Next", str(r))
        if not r:
            break

        r = hiew.Find(flags = hiew.HEM_FIND_BACKWARD, offset = r, data = "\xCC\xCC")
        hiew.Message("Back #1", str(r))

        r = hiew.Find(flags = hiew.HEM_FIND_BACKWARD, offset = r, data = "\xCC\xCC")
        hiew.Message("Back #2", str(r))

        break

# -----------------------------------------------------------------------
def test2():
    r = hiew.Find(flags = 0, offset = 0, data = "\xCC\xCC")
    while r is not None:
        dbg("offset: %s\n" % hex(r))
        r = hiew.FindNext()

test2()