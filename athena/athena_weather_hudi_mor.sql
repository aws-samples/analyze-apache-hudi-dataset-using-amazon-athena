CREATE EXTERNAL TABLE `weather_partition_mor`(
  `_hoodie_commit_time` string,
  `_hoodie_commit_seqno` string,
  `_hoodie_record_key` string,
  `_hoodie_partition_path` string,
  `_hoodie_file_name` string,
  `city_id` string,
  `timestamp` string,
  `relative_humidity` decimal(3,1),
  `temperature` decimal(3,1),
  `absolute_humidity` decimal(5,4)
  )
  PARTITIONED BY ( 
  `date` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hudi.hadoop.HoodieParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://athena-hudi-bucket/hudi_weather/weather_hudi_mor'
  
ALTER TABLE weather_partition_mor ADD
PARTITION (date = '2020-10-01') LOCATION 's3://athena-hudi-bucket/hudi_weather/weather_hudi_mor/2020-10-01/'
PARTITION (date = '2020-10-02') LOCATION 's3://athena-hudi-bucket/hudi_weather/weather_hudi_mor/2020-10-02/'
PARTITION (date = '2020-10-03') LOCATION 's3://athena-hudi-bucket/hudi_weather/weather_hudi_mor/2020-10-03/'
PARTITION (date = '2020-10-04') LOCATION 's3://athena-hudi-bucket/hudi_weather/weather_hudi_mor/2020-10-04/';
