# dashboad smashing docker ruby base

![smashing reminds me of a spike in volleyball](https://i.ytimg.com/vi/fCrBs7aVqT8/maxresdefault.jpg)
(smashing reminds me of a spike in volleyball)

- I thought of dashing at the educational scene and found a nice fork.
- Ruby is still an attractive language and in the new 3.x version, I want to create and deploy a docker with an easy installation where "smashing" works well. I've had a lot of help with other great open sources.
- express one's appreciation to all.

🍽️ Check out http://smashing.github.io/smashing for more information.

# Use
- Configure and use docker files as shown below.
- The image 'datamario24/ruby314notejs:1.0.3-smashing-new-bundle' in the FROM section is preset to the stack below.
- ruby 3.1.4 , nodejs 18.13.0 , smashing 1.3.6
- I hope there will be some savings in your time.
```bash
FROM datamario24/ruby314notejs:1.0.3-smashing-new-bundle

ENV PORT=80
ENV MAX_CONNS=30
ENV MAX_PERSISTENT_CONN=1
ENV THREADPOOL_SIZE=1

WORKDIR /app

COPY . .

CMD smashing start -p ${PORT} \
    --max-conns ${MAX_CONNS} \
    --max-persistent-conn ${MAX_PERSISTENT_CONN} \
    --threadpool-size ${THREADPOOL_SIZE}
```

# Development & Testing in the following environments
- Under the docker folder, there is an image generated step by step.
- If you're a simple user, you can skip the steps below. If you have a problem or want to improve, see the description below. It is open to send issues or PR at any time. You are very welcome.

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
- Follow the steps below to test the development computer. 
- See the [official guide](http://smashing.github.io/smashing) for a more detailed explanation.
```zsh
$ bundle

$ smashing -v   
1.3.6

$ smashing start
2023-09-01 08:35:09 +0900 Thin web server (v1.8.2 codename Ruby Razor)
2023-09-01 08:35:09 +0900 Maximum connections set to 1024
2023-09-01 08:35:09 +0900 Listening on 0.0.0.0:3030, CTRL+C to stop
```

### Docker job
- init multi-platform build
```zsh
$ docker buildx create --name multiarch-builder --use
Name:          multiarch-builder
Driver:        docker-container
Last Activity: 2023-09-01 06:31:45 +0000 UTC

Nodes:
Name:      multiarch-builder0
Endpoint:  unix:///var/run/docker.sock
Status:    running
Buildkit:  v0.12.1
Platforms: linux/arm64, linux/amd64, linux/amd64/v2, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/mips64le, linux/mips64, linux/arm/v7, linux/arm/v6
```

- multi-platform build & push
```zsh
$ docker buildx build -t datamario24/ruby314notejs:1.0.3-smashing-new-bundle \
  --push \
  --platform linux/arm64,linux/amd64,linux/riscv64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
  -f docker/Dockerfile.ruby314notejs.smashing-new-bundle .
  
# https://hub.docker.com/r/datamario24/dashboad-smashing-docker-ruby-base/tags
$ docker buildx build -t datamario24/dashboad-smashing-docker-ruby-base:1.0.0 \
  --push \
  --platform linux/arm64,linux/amd64,linux/riscv64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
  -f docker/Dockerfile .
  
 
```

- create and start containers using docker hub images
```zsh
$ docker run -d --name smashing-default -p 7942:80 datamario24/dashboad-smashing-docker-ruby-base:1.0.0
```

### Ref
- https://www.ruby-lang.org/ko/news/2023/03/30/ruby-3-1-4-released/
- https://github.com/macournoyer/thin
- [x] https://github.com/ruby/webrick
- [x] https://github.com/Smashing/smashing/wiki/Use-Docker-to-run-Smashing#dockerfile
- [x] [멀티 플랫폼을 위한 Buildx 도커 이미지 빌드](https://gurumee92.tistory.com/311)

### Err
- [failed to register layer: Error processing tar file(exit status 1): write /usr/local/lib/libruby.so.3.1.4: no space left on device](https://stackoverflow.com/questions/48814940/docker-pull-failed-to-register-layer-error-processing-tar-fileexit-status-1)