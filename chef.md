1. Role with run_list: to add recipe that a role / node type will need to run

2. Chef Vault usage:
   - set up config and .chef folder to be used:
   ```
   yayang@iad-bidder-x6:~/.chef$ ls
   config.rb  data_bags
   yayang@iad-bidder-x6:~/.chef$ cat config.rb 
   chef_server_url "https://iad-chef.mediamath.com/organizations/media"
   client_key      "/etc/chef/client.pem"
   node_name 'yayang'
   data_bag_path "/home/yang.yang/.chef/data_bags"
   ```
   - go to admin of chef / user profile get private pem and store in the /client.pem location above. ( stored in local .ssh )
   - knife vault create certificates yytt '{"a": "b", "c":"d"}' --mode client
   - knife vault show certificates yytt --mode client
   - knife vault update certificates yytt --clients iad-bidder-x3,iad-bidder-x2 --admins mozek --mode client
   - https://www.dhruvsahni.com/quick-guide-to-chef-vault
   - `--mode client` or upload / download could work.
