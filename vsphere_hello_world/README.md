# vsphere_hello_world


這個專案主要是一個使用 [vSphere provider](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs) 的 hello world，使用 template 建立客製化的 VM。


## 客製化項目


- Linux OS 內的 `hostname` 與 `domain`。
- Linux OS 內 `eth0` 的 IPv4 address/prefix/gateway/DNS 。
- 將該台 VM 放入指定 folder 內。


## Bug


- 在客製化 `hostname` 時 **<span style='color:red'>不能使用底線 (underscore)</span>**。 因此在 `main.tf` 當中都是使用沒有帶有底線的 `domain` 代替。\
(這個 bug 已經發 [issue](https://github.com/hashicorp/terraform-provider-vsphere/issues/1490) 給官方)


- (不確定是不是 vCenter 沒有建 Cluster 的緣故) 只能將 `vm_1` 建立在 template 所在的 ESXi host 上，沒辦法透過設定 `resource_pool_id`, `host_system_id`, `datastore_id` 達成。