# fastdfs-exporter
## Dashboard

![image](https://github.com/whithen/fastdfs-exporter/blob/master/FastDFSMonitor.png)

## docker运行

$ sudo docker run -itd  --network=fastdfs-net --name fastdfs-exporter -e TRACKER_SERVER=tracker:22122 -p 19018:9018 fastdfs-exporter:latest

## curl metrics

$ curl localhost:9018/metrics
