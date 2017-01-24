import hiew

def testMain():
    global TEST_X
    try:
        TEST_X
    except:
        TEST_X = 1
        hiew.Message("init", "initititit!")

    hiew.Message("run!", "running!")
