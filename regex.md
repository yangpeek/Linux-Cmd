## Regex Tools

1. https://www.tutorialsteacher.com/regex/substitution

## Regex Substitution

1. when ()* matches multiple, it only reserve the last one for the reference.
2. When using substitution, unmatched ones always carry over.
3. Substitution begins from index 1.
```
core.pbs.pops.iad.iad-xxx-x1.org.apache.cassandra.metrics.ClientRequest.Latency.Write.count
/core\.pbs\.pops\.(...)\.([A-Za-z0-9-]+\.)*/ 
Count is unmatched.

/core\.pbs\.pops\.(iad)\.([iad-xxx-x1)\.(org.apache.cassandra.metrics.ClientRequest.Latency.Write.count)/
/core\.pbs\.pops\.(...)\.([A-Za-z0-9-]+)\.(.*)/
core.pbs.totals.$1.$3
```
