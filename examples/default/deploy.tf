module "this" {
  source = "../../"

  # NOTE: I know this does not actually test the functionality of the container,
  # but during testing, we're not able to actually autoscale a cluster.
  command       = []
  arguments     = ["sleep", "3600"]
  image_version = "v1.14.7"
  envs = {
    foo = "bar"
  }
}
