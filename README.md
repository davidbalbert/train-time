# Train Time

A real-time NYC Subway schedule web app.

## Developing

To get started:

```
$ bundle install
$ rake .env
$ rake db:create
$ foreman start
```

## Deployment

When you deploy, make sure to set the environmental variable `SECRET_TOKEN`. You can use `rake secret` to generate one.
