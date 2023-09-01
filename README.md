# dashboad smashing docker ruby base

![smashing reminds me of a spike in volleyball](https://i.ytimg.com/vi/fCrBs7aVqT8/maxresdefault.jpg)
(smashing reminds me of a spike in volleyball)

- I thought of dashing at the educational scene and found a nice fork.
- Ruby is still an attractive language and in the new 3.x version, I want to create and deploy a docker with an easy installation where "smashing" works well. I've had a lot of help with other great open sources.
- express one's appreciation to all.

🍽️ Check out http://smashing.github.io/smashing for more information.

### Development & Testing in the following environments
```zsh
$ sysctl -a | grep brand
machdep.cpu.brand_string: Apple M1 Pro
$ sw_vers
ProductName:		macOS
ProductVersion:		13.0.1
BuildVersion:		22A400
$ rbenv versions
  system
  2.7.5
  2.7.6
* 3.1.1 (set by /Users/m2/.rbenv/version)
  3.1.2
$
```

### Run
```zsh
$ bundle
... 

$ smashing -v   
1.3.6

$ smashing start
2023-09-01 08:35:09 +0900 Thin web server (v1.8.2 codename Ruby Razor)
2023-09-01 08:35:09 +0900 Maximum connections set to 1024
2023-09-01 08:35:09 +0900 Listening on 0.0.0.0:3030, CTRL+C to stop
```

### Docker
```zsh
$ docker build -t ruby314webrick:0.2.3 .
$ docker run -d -p 6543:3456 --name ruby314webrick023 ruby314webrick:0.2.3
$ docker ps
#CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS                    NAMES
#1a7cd24bb7b6   ruby314webrick:0.2.0   "/bin/sh -c 'ruby -r…"   7 seconds ago   Up 6 seconds   0.0.0.0:6543->3456/tcp   ruby314webrick
```

### Ref
- https://www.ruby-lang.org/ko/news/2023/03/30/ruby-3-1-4-released/
- https://github.com/macournoyer/thin
- [x] https://github.com/ruby/webrick

### Err
- [failed to register layer: Error processing tar file(exit status 1): write /usr/local/lib/libruby.so.3.1.4: no space left on device](https://stackoverflow.com/questions/48814940/docker-pull-failed-to-register-layer-error-processing-tar-fileexit-status-1)