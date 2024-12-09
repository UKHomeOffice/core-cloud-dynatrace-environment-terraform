terraform {
  required_providers {
    dynatrace = {
      source = "dynatrace-oss/dynatrace"
      version = "1.70.0"
    }

    github = {
      source = "integrations/github"
      version = "6.4.0"
    }
  }
}

provider "github" {
  # Configuration options
}


provider "dynatrace" {
    # Configuration options
}


