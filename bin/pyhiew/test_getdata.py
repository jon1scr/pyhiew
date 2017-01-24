import hiew

dbg = hiew.dbg

d = hiew.GetData()

hiew.Window.FromString("Title",
  ("filename=%s\n"
   "offsetMark1=%s\n"
   "offsetMark2=%s\n"
   "offsetCurrent=%s\n"
  ) % (d.filename, d.offsetMark1, d.offsetMark2, d.offsetCurrent))

