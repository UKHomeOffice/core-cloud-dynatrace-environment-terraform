
resource "dynatrace_hub_extension_config" "hub_extension" {
  name            = var.extension_name
  management_zone = var.management_zone
  value = jsonencode(
    {
      "enabled" : var.enabled,
      "description" : var.description,
      "version" : var.extn_version,

      # List of feature sets
      "featureSets" : [
        for feature_set in var.featureSets : feature_set
      ],
      "activationTags" : [for tag in var.activationTags : tag]
    }
  )

}