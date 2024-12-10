1.AWS s3 cp file with profile:
  - aws s3 cp s3://mm-reporting-shared/tmp/ipv4_geo/ipv4_geo.2024-03-07_11:00:00.txt.gz ipv4.txt.gz --profile aws_media

2. aws sso login:
  ```
  aws sso login --profile mm-bidder --no-browser
  ```

3. aws config: `~/.aws/`
