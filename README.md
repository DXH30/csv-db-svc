# Introduction
This is a simple CSV based Database-service created using Sinatra

# Rubygem
## How to build this
1. Build this gem using `gem build`
```bash
gem build csv-db-svc.gemspec
```
2. Push the gem using `gem push`
```bash
gem push --key github --host https://rubygems.pkg.github.com/DXH30 csv-db-svc-version.gem
```

# Docker
## How to start this service
1. Start the docker service using docker-compose
```bash
docker-compose up -d
```

2. You can check the url in browser
```
http://localhost:4567
```

## How to test the service
1. Just use the script
```bash
./tests/filter.sh
```

## Prerequisite
1. Docker