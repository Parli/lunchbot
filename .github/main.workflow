workflow "New workflow" {
  on = "push"
  resolves = ["build"]
}

action "build" {
  uses = "actions/docker/cli@master"
  runs = "build -f web.Dockerfile ."
}
