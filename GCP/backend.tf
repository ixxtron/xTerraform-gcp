// // # Set GCS Backend to store state file in a GCS bucket
// ## -> gcloud auth application-default login
// ### -> Credentials saved to file: [/Users/victor.zamora/.config/gcloud/application_default_credentials.json]
terraform {
  backend "gcs" {
   # credentials = "/Users/victor.zamora/.config/gcloud/application_default_credentials.json"
    credentials = "/Users/victor.zamora/IXX_REPO/2022/iXXTRON/xTerraform-gcp-keys.json"
    bucket      = "xtf-state-files"
    prefix      = "infra-essnetials"
  }
}
