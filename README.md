My dev setup.

Install chef-solo:
```
wget -O- https://opscode.com/chef/install.sh | sudo bash
```

Then run:
```
sudo chef-solo -c solo.rb -j james.json
```
