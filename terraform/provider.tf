provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::968225077300:role/YoutubeTerraformLiveRole"
  }
}