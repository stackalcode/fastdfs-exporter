# fastdfs-exporter  

### fastdfs-exporter是通过调用fdfs_monitor命令，对fastdfs本身的输出结果进行格式化，输出到prometheus  

## docker运行 

```
$ sudo docker run -itd  --network=fastdfs-net --name fastdfs-exporter -e TRACKER_SERVER=tracker:22122 -p 19018:9018 fastdfs-exporter:latest
```
--network: 容器网络要和fastdfs运行在同一个容器网络内，可以指定主机网络，如--network=host  
TRACKER_SERVER：指定tracker地址

## curl metrics
```
$ curl localhost:9018/metrics
```  
![image](https://github.com/stackalcode/fastdfs-exporter/blob/main/metrics.jpg)  
  
### 将DashboardGrafana.json导入到grafana中就可以出现如下监控聚合图形  

## Dashboard

![image](https://github.com/whithen/fastdfs-exporter/blob/master/FastDFSMonitor.png)

### 本项目根据 https://github.com/opencmit2/CMfastDFS-exporter.git  的基础上修改
