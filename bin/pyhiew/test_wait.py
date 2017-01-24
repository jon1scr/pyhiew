import hiew
import time

dbg = hiew.dbg

hiew.MessageWaitOpen("Waiting....")
time.sleep(1)
hiew.MessageWaitClose()

hiew.MessageWaitOpen()
while not hiew.HiewGate_IsKeyBreak():
    time.sleep(1)
hiew.MessageWaitClose()
