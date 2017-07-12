# Docker Example - An Automatic HTTPS web with [Caddy]

[Caddy] is the HTTP/2 web server with automatic HTTPS. Github stars 11,994.

[Caddy] + [Docker] = Super fast static web site that go anywhere.

## Prerequisites

#### Add test site name to /etc/hosts or your DNS server

E.g. the test site FQDN is _docker-example.example.com_

```
$ sudo echo "127.0.0.1 docker-example.example.com" >> /etc/hosts
```

#### Optional GCP Auth

If you want try out _Automatic HTTPS_ with Google Cloud DNS Challenge,
you need to have _gcloud_ installed.

And you must have admin rights on a managed DNS Zone in your GCP Project defined in envs. To get the GCP credentials:

```
$ gcloud auth login
```

## Build the caddy docker image

```
$ make build
```

If all you wanted to do is to build the image, you can tag the image and publish it to your registry.

```
$ docker tag caddy:latest <my-caddy>
$ docker push <registry URI>
```

## Bring web server it up

```
$ make web
```

## Working on the website source

Then edit html files in srv/site/public and reload page on the brower.

## Shut it down

```
$ make down
```

[Caddy]: https://caddyserver.com/
[Docker]: https://www.docker.com/
