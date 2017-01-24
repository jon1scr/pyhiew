import hiew

dbg = hiew.dbg

r = hiew.GetStringDual("Enter string", 10, "\x11\x22\x33\x44", False)

hiew.Message("Info", str(r))