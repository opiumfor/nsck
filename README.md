Launch:

```docker-compose up -d```

Check if a port is being listened:
```bash
curl 127.0.0.1:9559/port/9559
true
```

Check if a process(-es) matching the pattern are running:
```bash
curl localhost:9559/process/ngi
[{'name': 'nginx', 'user': 'root', 'pid': '27972'}, {'name': 'nginx', 'user': 'xfs', 'pid': '28103'}]
```
NOTES: 
- ports are checked for complete match via `grep -w`
- process are matched using "startswith" function