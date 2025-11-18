
resource "dynatrace_hub_extension_config" "hub_extension" {
  name = var.extension_name
  # Optional attributes for scoping environment level scope if none are set
  management_zone   = var.management_zone
  active_gate_group = var.active_gate_group
  host_group        = var.host_group
  host              = var.host
  # end of optional attributes

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