docker-github-pages
===================

Based on @jclagache's [docker-github-pages](https://github.com/jclagache/docker-github-pages)

Simple Docker Image for [Jekyll](http://jekyllrb.com/) works closely as [GitHub pages](https://pages.github.com/).
Develop and build locally your Jekyll website before committing to GitHub without the pain to install the ruby/Jekyll stack.

- based on the official [ruby:2.3.2-alpine image](https://registry.hub.docker.com/_/ruby/)
- [GitHub Pages ruby gem](https://github.com/github/pages-gem) version 104
- [therubyracer](https://github.com/cowboyd/therubyracer) as javascript interpreter

Usage
---
Assuming `/my-awesome-site` is your local directory containing the Jekyll website :

```bash
$ docker build -t github-pages .
$ docker run --rm -p 4000:4000 -v /my-awesome-site:/site github-pages
```
will serve the site and watch for changes automatically at `http://localhost:4000`
