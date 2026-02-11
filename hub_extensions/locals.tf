locals {
  is_python_cert_monitor = var.extension_name == "com.dynatrace.custom.python-certificate-monitor"
  is_timedrift           = var.extension_name == "com.dynatrace.timedrift"

  extension_configs = {
    
    # ========================================================================
    # PYTHON CERTIFICATE MONITOR 
    # ========================================================================
    python_cert = {
      "enabled" : var.enabled,
      "description" : var.description,
      "version" : var.extn_version,
      "activationContext" : var.activationContext,
      "activationTags" : var.activationContext == "LOCAL" ? var.activationTags : [],
      
      "pythonLocal" : var.activationContext == "LOCAL" ? {
        "alerting_configuration" : {
          "days_event_stage_1" : var.alerting_configuration != null && var.alerting_configuration.expiryWarningDays != null ? var.alerting_configuration.expiryWarningDays : 30,
          "days_event_stage_2" : var.alerting_configuration != null && var.alerting_configuration.expiryCriticalDays != null ? var.alerting_configuration.expiryCriticalDays : 7,
          "check_interval" : var.log_event_interval != null ? var.log_event_interval : 1.0
        },
        "enable_ua_and_metrics" : {
          "enable_ua_and_metrics" : var.enable_ua_and_metrics != null ? var.enable_ua_and_metrics : true
        },
        "filter_technologies" : {
          "filter_technologies" : var.filter_technologies != null && length(var.filter_technologies) > 0 ? true : false,
          "pg_technologies_list" : var.filter_technologies != null && length(var.filter_technologies) > 0 ? var.filter_technologies : []
        },
        "port_range" : {
          "customize_port_range" : var.port_range != null && var.port_range != "1-65535" ? true : false,
          "ports_include" : var.port_range != null && var.port_range != "1-65535" ? var.port_range : "1-65535"
        },
        "additional_sni" : {
          "additional_sni_bool" : var.additional_sni != null && length(var.additional_sni) > 0 ? true : false,
          "additional_sni" : var.additional_sni != null && length(var.additional_sni) > 0 ? var.additional_sni : []
        },
        "log_event_interval" : {
          "log_event_interval_bool" : var.log_event_interval != null && var.log_event_interval != 60 ? true : false,
          "log_event_interval" : var.log_event_interval != null && var.log_event_interval != 60 ? var.log_event_interval : 1.0
        },
        "check_hosts" : {
          "check_host_domain" : var.check_hosts != null && length(var.check_hosts) > 0 ? true : false,
          "domain_list" : var.check_hosts != null && length(var.check_hosts) > 0 ? [
            for host in var.check_hosts : "${host.domain}:${host.port}"
          ] : []
        },
        "debug" : var.debug != null ? var.debug : false
      } : null,
      
      "pythonRemote" : var.activationContext == "REMOTE" ? {
        "alerting_configuration" : {
          "days_event_stage_1" : var.alerting_configuration != null && var.alerting_configuration.expiryWarningDays != null ? var.alerting_configuration.expiryWarningDays : 30,
          "days_event_stage_2" : var.alerting_configuration != null && var.alerting_configuration.expiryCriticalDays != null ? var.alerting_configuration.expiryCriticalDays : 7,
          "check_interval" : var.log_event_interval != null ? var.log_event_interval : 1.0
        },
        "enable_ua_and_metrics" : {
          "enable_ua_and_metrics" : var.enable_ua_and_metrics != null ? var.enable_ua_and_metrics : true
        },
        "log_event_interval" : {
          "log_event_interval_bool" : var.log_event_interval != null && var.log_event_interval != 60 ? true : false,
          "log_event_interval" : var.log_event_interval != null && var.log_event_interval != 60 ? var.log_event_interval : 1.0
        },
        "check_hosts" : {
          "check_host_domain" : var.check_hosts != null && length(var.check_hosts) > 0 ? true : false,
          "domain_list" : var.check_hosts != null && length(var.check_hosts) > 0 ? [
            for host in var.check_hosts : "${host.domain}:${host.port}"
          ] : []
        },
        "debug" : var.debug != null ? var.debug : false
      } : null,
      
      "featureSets" : tolist([])
    }
    
    # ========================================================================
    # TIMEDRIFT EXTENSION 
    # ========================================================================
    timedrift = {
      "enabled" : var.enabled,
      "description" : var.description,
      "version" : var.extn_version,
      "activationContext" : var.activationContext,
      "activationTags" : var.activationTags,
      
      "pythonLocal" : {
        "use_chrony" : var.use_chrony != null ? var.use_chrony : true,
        "autodetected_report_errors" : var.autodetected_report_errors != null ? var.autodetected_report_errors : true,
        "servers" : var.servers != null ? [
          for server in var.servers : {
            "server" : server.server,
            "port" : server.port != null ? server.port : 123,
            "ntp_version" : server.ntp_version != null ? server.ntp_version : 4,
            "report_error" : server.report_error != null ? server.report_error : true
          }
        ] : [],
        "debug_logging" : var.debug_logging != null ? var.debug_logging : false,
        "frequency" : var.frequency != null ? var.frequency : 5
      }
    }
    
    # ========================================================================
    # OTHER EXTENSIONS (HADOOP, JMX, ETC)
    # ========================================================================
    other = {
      "enabled" : var.enabled,
      "description" : var.description,
      "version" : var.extn_version,
      "featureSets" : var.featureSets != null ? tolist(var.featureSets) : tolist([]),
      "activationTags" : var.activationTags,
      "activationContext" : var.activationContext,
      "pythonLocal" : null,
      "pythonRemote" : null
    }
  }
  
  # Select the right configuration
  extension_type = local.is_python_cert_monitor ? "python_cert" : (
    local.is_timedrift ? "timedrift" : "other"
  )
  
  extension_value = local.extension_configs[local.extension_type]
  
  # Remove only top-level null values
  extension_value_clean = {
    for k, v in local.extension_value : k => v if v != null
  }
}