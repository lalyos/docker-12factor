## 12 factor sample app

For docker/k8s training purposes I need a simple sample app, where I can demonstrate different containerization features.

So this is a [12factor](https://12factor.net/)-ized "webapp". I mean its a webserver with some very minimal dynamic webpage(s).

## Usage

```
docker run -d \
  -p 80 \
  -e TITLE=CoffeBreak \
  -e COLOR=lightgreen \
  lalyos/12factor
```

## Configuration

As its a 12factor app it can be configure with environment variables:

- TITLE: the main header message of the webpage
- COLOR: background color of the page
- BODY: optional text/html displayed as the content

## Tags

- lalyos/12factor:edge (push to master)
- lalyos/12factor:mybranch (push to mybranch)
- lalyos/12factor:v1.2.3 (create tag v1.2.3)
- lalyos/12factor:v1.2   (create tag v1.2.3)
- lalyos/12factor:v1     (create tag v1.2.3)
- lalyos/12factor:pr-12 (PR opened)
- lalyos/12factor:git-ad132f5 (git commit hash)


see: [hithub action config](https://github.com/lalyos/docker-12factor/blob/master/.github/workflows/docker-image.yml#L28-L34)
see: [metadata github action docs](https://github.com/docker/metadata-action#typesemver)


## build

docker buildx build \
  --push \
  --platform linux/arm64/v8,linux/amd64 \
  --tag ttl.sh/12factor .
