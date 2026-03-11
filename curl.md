- Curl output format with network information:
```
curl -w "@curl-format.txt" "..."
curl-format.txt
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
```

- Oauth Token
  ```
  # special char in password, use single quote
  curl -X POST "https://.../oauth/token" -u 'username:password' -d "grant_type=client_credentials"
  curl -s -H "Authorization: Bearer ..." "https://url"
  ```
