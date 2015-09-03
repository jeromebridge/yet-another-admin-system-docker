# Yet Another Admin System Executable Container

This docker image includes Yet Another Admin System Boot.

## Usage

```bash
mkdir /tmp/yaas
sudo docker run -d --name=app --link db:db -p 8080:8080 -v /tmp/yaas:/working jeromebridge/yet-another-admin-system
```

## Building
sudo docker build -t jeromebridge/yet-another-admin-system .