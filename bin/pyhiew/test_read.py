import hiew

dbg = hiew.dbg
r, s = hiew.FileRead(0, 2)
dbg("r=%d s=<%s>\n" %(r, s))

r, s = hiew.FileRead(200000000, 2)
dbg("r=%d s=<%s>\n" %(r, s))

r, s = hiew.FileRead(0, 20000)
dbg("r=%d slen=<%d>\n" %(r, len(s)))
