Launch:

```docker-compose up -d```

Check if a port is being listened:
```bash
curl 127.0.0.1:9559/port/9559
true
```

Check if a process matching the pattern are running:
```bash
curl localhost:9559/process/ngi                                                                                                                         1:03
['nginx', 'nginx', 'nginx', 'nginx', 'nginx', 'nginx']
```
NOTES: 
- ports are checked by fullmatch via `grep -w`
- process are matched using "startswith" function