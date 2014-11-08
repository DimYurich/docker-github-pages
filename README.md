docker-github-pages
===================

Simple Docker Image for [Jekyll](http://jekyllrb.com/) works closely as [GitHub pages](https://pages.github.com/).
Develop and build locally your Jekyll website before committing to GitHub without the pain to install the ruby/Jekyll stack.

- based on the official [ruby:2.1 image](https://registry.hub.docker.com/_/ruby/)
- [GitHub Pages ruby gem](https://github.com/github/pages-gem) version 28
- [therubyracer](https://github.com/cowboyd/therubyracer) as javascript interpreter

Usage
---
Assuming `/my-awesome-site` is your local directory containing the Jekyll website : 

```bash
$ docker pull jclagache/github-pages
$ docker run --rm -p 4000:4000 -v /my-awesome-site:/src jclagache/github-pages serve
```
will serve the site and watch for changes automatically at `http://localhost:4000`

Boot2docker
---

Since [boot2docker](http://boot2docker.io/) now includes [the VirtualBox Guest Additions built in](https://github.com/boot2docker/boot2docker/pull/534), you can use the VirtualBox folder sharing. Some share names will be [automatically mounted](https://github.com/boot2docker/boot2docker#user-content-virtualbox-guest-additions) but you can mount your own. In the host :  

```bash
$ vboxmanage sharedfolder add "boot2docker-vm" --name GitHub-share--hostpath /my-awesome-site --automount
```

In the guest, mount it wherever you want : 

```bash
$ sudo mkdir /my-awesome-site
$ sudo mount -t vboxsf -o uid=1000,gid=50 GitHub-share /my-awesome-site
```

Download the image and run the container : 

```bash
$ docker pull jclagache/github-pages
$ docker run --rm -p 4000:4000 -v /my-awesome-site:/src jclagache/github-pages serve --force_polling
```

Note that you must pass the ```--force_polling``` option to watch for changes automatically due to Jekyll ([Listen](https://github.com/guard/listen)) [vboxfs issue](https://github.com/jekyll/jekyll/issues/1808).




