// // # Set GCS Backend to store state file in a GCS bucket
// ## -> gcloud auth application-default login
// ### -> Credentials saved to file: [/Users/victor.zamora/.config/gcloud/application_default_credentials.json]
terraform {
  backend "gcs" {
    credentials = "/Users/victor.zamora/.config/gcloud/application_default_credentials.json"
    bucket      = "xtf-state-files"
    prefix      = "basics101"
  }
}
