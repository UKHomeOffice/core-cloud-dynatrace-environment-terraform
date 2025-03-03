resource "dynatrace_json_dashboard" "this" {
  contents = <<EOT
{
    "metadata": {
      "configurationVersions": [
        7
      ],
      "clusterVersion": "1.305.88.20250104-012102"
    },
    "dashboardMetadata": {
      "name": "GHES Monitoring Dashboard",
      "shared": true,
      "owner": "e-Mohammed.Shareef42@eng.homeoffice.gov.uk",
      "popularity": 1,
      "hasConsistentColors": false
    },
    "tiles": [
      {
        "name": "Host Performance ",
        "tileType": "HEADER",
        "configured": true,
        "bounds": {
          "top": 0,
          "left": 0,
          "width": 304,
          "height": 38
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false
      },
      {
        "name": "Process Analysis",
        "tileType": "HEADER",
        "configured": true,
        "bounds": {
          "top": 342,
          "left": 0,
          "width": 304,
          "height": 38
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false
      },
      {
        "name": "Disk Analysis",
        "tileType": "HEADER",
        "configured": true,
        "bounds": {
          "top": 646,
          "left": 0,
          "width": 304,
          "height": 38
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false
      },
      {
        "name": "CPU usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 38,
          "left": 0,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "CPU usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.idle:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.iowait:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "C",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.user:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "D",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.system:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "E",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.steal:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "F",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.cpu.other:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "STACKED_AREA",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "GRAY",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "C:",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "D:",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "E:",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "F:",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "AREA"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": [
              {
                "visible": true,
                "min": "0",
                "max": "100.00001",
                "position": "LEFT",
                "queryIds": [
                  "A",
                  "B",
                  "C",
                  "D",
                  "E",
                  "F"
                ],
                "defaultAxis": true
              }
            ]
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.cpu.idle:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names,(builtin:host.cpu.iowait:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names,(builtin:host.cpu.user:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names,(builtin:host.cpu.system:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names,(builtin:host.cpu.steal:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names,(builtin:host.cpu.other:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names"
        ]
      },
      {
        "name": "Memory usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 38,
          "left": 608,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Memory usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.recl:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "C",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "D",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.kernel:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "C:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "D:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.mem.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.recl:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.kernel:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names"
        ]
      },
      {
        "name": "Traffic",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 38,
          "left": 1216,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Traffic",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.net.nic.trafficIn:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):merge(\"dt.entity.network_interface\"):sum",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.net.nic.trafficOut:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):merge(\"dt.entity.network_interface\"):sum",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "ROYALBLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "ROYALBLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.net.nic.trafficIn:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):merge(\"dt.entity.network_interface\"):sum):limit(100):names,(builtin:host.net.nic.trafficOut:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):merge(\"dt.entity.network_interface\"):sum):limit(100):names"
        ]
      },
      {
        "name": "CPU usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 380,
          "left": 0,
          "width": 988,
          "height": 266
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "CPU usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:tech.generic.cpu.usage:filter(or(in(\"dt.entity.process_group_instance\",entitySelector(\"type(PROCESS_GROUP_INSTANCE) AND fromRelationship.isProcessOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.process_group_instance\"):sort(value(auto,descending)):limit(10):avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:tech.generic.cpu.usage:filter(or(in(\"dt.entity.process_group_instance\",entitySelector(\"type(PROCESS_GROUP_INSTANCE) AND fromRelationship.isProcessOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.process_group_instance\"):sort(value(auto,descending)):limit(10):avg):limit(100):names"
        ]
      },
      {
        "name": "Memory usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 380,
          "left": 1026,
          "width": 798,
          "height": 266
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Memory usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:tech.generic.mem.workingSetSize:filter(or(in(\"dt.entity.process_group_instance\",entitySelector(\"type(PROCESS_GROUP_INSTANCE) AND fromRelationship.isProcessOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.process_group_instance\"):sort(value(auto,descending)):limit(10):avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:tech.generic.mem.workingSetSize:filter(or(in(\"dt.entity.process_group_instance\",entitySelector(\"type(PROCESS_GROUP_INSTANCE) AND fromRelationship.isProcessOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.process_group_instance\"):sort(value(auto,descending)):limit(10):avg):limit(100):names"
        ]
      },
      {
        "name": "Space usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 684,
          "left": 0,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Space usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "((builtin:host.disk.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))))+(builtin:host.disk.avail:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.avail:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "C",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE",
                "alias": "Disk total"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA",
                "alias": "Disk available"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "C:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA",
                "alias": "Disk used"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(((builtin:host.disk.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))))+(builtin:host.disk.avail:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))))):splitBy(\"dt.entity.host\"):sum):limit(100):names,(builtin:host.disk.avail:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names,(builtin:host.disk.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names"
        ]
      },
      {
        "name": "Throughput",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 684,
          "left": 608,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Throughput",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.bytesWritten:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.bytesRead:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.disk.bytesWritten:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names,(builtin:host.disk.bytesRead:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names"
        ]
      },
      {
        "name": "IOPS",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 684,
          "left": 1216,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "IOPS",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.writeOps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.disk.readOps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.disk.writeOps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names,(builtin:host.disk.readOps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):filter(or(in(\"dt.entity.disk\",entitySelector(\"type(DISK) AND fromRelationship.isDiskOf(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy(\"dt.entity.host\"):sum):limit(100):names"
        ]
      },
      {
        "name": "Container Analysis",
        "tileType": "HEADER",
        "configured": true,
        "bounds": {
          "top": 988,
          "left": 0,
          "width": 304,
          "height": 38
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false
      },
      {
        "name": "CPU usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1026,
          "left": 0,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "CPU usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:containers.cpu.usageSystemMilliCores:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:containers.cpu.usageUserMilliCores:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:containers.cpu.usageSystemMilliCores:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg):limit(100):names,(builtin:containers.cpu.usageUserMilliCores:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg):limit(100):names"
        ]
      },
      {
        "name": "Memory usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1026,
          "left": 608,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Memory usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:containers.memory.residentSetBytes:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:containers.memory.residentSetBytes:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg):limit(100):names"
        ]
      },
      {
        "name": "CPU throttling",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1026,
          "left": 1216,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "CPU throttling",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:containers.cpu.throttledTime:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:containers.cpu.throttledTime:filter(or(in(\"dt.entity.container_group_instance\",entitySelector(\"type(CONTAINER_GROUP_INSTANCE) AND fromRelationships.isCgiOfHost(type(HOST),entityId(${var.ghes_hostname}))\")))):splitBy():avg):limit(100):names"
        ]
      },
      {
        "name": "Memory Analysis",
        "tileType": "HEADER",
        "configured": true,
        "bounds": {
          "top": 1330,
          "left": 0,
          "width": 304,
          "height": 38
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false
      },
      {
        "name": "Memory usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1368,
          "left": 0,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Memory usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.recl:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "C",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "D",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.kernel:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "C:",
              "properties": {
                "color": "BLUE",
                "seriesType": "STACKED_AREA"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "D:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.mem.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.recl:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.kernel:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names"
        ]
      },
      {
        "name": "Page faults",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1368,
          "left": 608,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Page faults",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.avail.pfps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.mem.avail.pfps:filter(eq(\"dt.entity.host\",${var.ghes_hostname})):avg):limit(100):names"
        ]
      },
      {
        "name": "Swap usage",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 1368,
          "left": 1216,
          "width": 608,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Swap usage",
        "queries": [
          {
            "id": "A",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.swap.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "spaceAggregation": "AUTO",
            "timeAggregation": "DEFAULT",
            "metricSelector": "builtin:host.mem.swap.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))",
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {
            "hideLegend": false
          },
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "properties": {
                "color": "BLUE",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "visible": true
            },
            "yAxes": []
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(builtin:host.mem.swap.total:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names,(builtin:host.mem.swap.used:filter(eq(\"dt.entity.host\",${var.ghes_hostname}))):limit(100):names"
        ]
      }
    ]
  }
EOT
}
data "dynatrace_iam_group" "ho_cc_platform_engineer_env_admin" {
  name = var.dt_admin_group_name
}

resource "dynatrace_dashboard_sharing" "this" {
  dashboard_id = dynatrace_json_dashboard.this.id
  enabled = true
  permissions {
    permission {
      id    = data.dynatrace_iam_group.ho_cc_platform_engineer_env_admin.id
      level = "EDIT"
      type  = "GROUP"
    }
  }
}