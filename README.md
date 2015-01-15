# Overview #

Deployment repo using vagrant and salt as provisioner (thanks to trampie).

# Installation #

Install vagrant-hostmanager

```
vagrant plugin install vagrant-hostmanager
```

Init trampie submodule

```
git submodule init
git submodule update
```

### Optional ###

Install vagrant-aws

```
vagrant plugin install vagrant-aws
```

# Usage #

For details please refer to trampie repository: [https://github.com/elyast/trampie]()

### Pillar ###

`top.sls` applies pillar data on every server that can be refered in states as

```
	pillar['message_do_not_modify']
```

### States ###

`top.sls` applies on every server that has grain: `roles` and one of the values is `java` state file located in java/openjdk.sls
