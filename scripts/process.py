#!/usr/bin/env python3
import sys
import psutil


def find_process_by_name(pattern):
    "Return a list of processes matching 'name'."
    ls = []
    psutil.PROCFS_PATH = "/host/proc"
    for p in psutil.process_iter():
        name_ = ""
        try:
            name_ = p.name()
        except (psutil.AccessDenied, psutil.ZombieProcess):
            pass
        except psutil.NoSuchProcess:
            continue
        if name_.startswith(pattern):
            ls.append(name_)
    return ls


result = find_process_by_name(sys.argv[1])
exitCode = 0 if result.__len__() > 0 else 1
print(result)
exit(exitCode)