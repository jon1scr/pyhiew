import hiew

dbg = hiew.dbg

rc = hiew.FileOpenForWrite()
dbg("openforwrite: rc=%d\n" % rc)

rc = hiew.FileWrite(0, "Hello world")
dbg("write: rc=%d\n" % rc)
