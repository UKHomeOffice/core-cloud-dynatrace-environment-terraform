resource "dynatrace_json_dashboard" "comos_rds_dasboard_terraform" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : "RDS_dashboard_template",
        "shared" : true,
        "owner" : "Cosmos",
        "preset" : true,
        "dynamicFilters" : {
          "filters" : [
            "CUSTOM_DIMENSION:Amazon RDS"
          ]
        }
      },
      "tiles" : [
        {
          "name" : "FreeableMemory",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
            "left" : 38,
            "width" : 266,
            "height" : 266
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.freeableMemoryByRegionEngineName",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "GRAPH_CHART",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "displayName" : "",
                "visible" : true
              },
              "yAxes" : [
                {
                  "displayName" : "",
                  "visible" : true,
                  "min" : "AUTO",
                  "max" : "AUTO",
                  "position" : "LEFT",
                  "queryIds" : [
                    "A"
                  ],
                  "defaultAxis" : true
                }
              ]
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=null&(ext:cloud.aws.rds.freeableMemoryByRegionEngineName:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "DatabaseConnections",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
            "left" : 380,
            "width" : 304,
            "height" : 266
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "DatabaseConnections",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.databaseConnectionsSum",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.databaseConnectionsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.rds.databaseConnectionsSum:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        },
        {
          "name" : "CPUUtilization",
          "nameSize" : "medium",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
            "left" : 760,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "CPUUtilization",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.cpuUtilization",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.ec.cpuUtilization:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.ec.cpuUtilization:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        },
        {
          "name" : "FreeStorageSpace",
          "nameSize" : "medium",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 0,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "FreeStorageSpace",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.freeStorageSpace",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "PIE_CHART",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.freeStorageSpace:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ReadLatency",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 380,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "ReadLatency",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.readLatency",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.readLatency:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.rds.readLatency:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        },
        {
          "name" : "WriteLatency",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 760,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "WriteLatency",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.writeLatency",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.writeLatency:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.rds.writeLatency:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        },
        {
          "name" : "NetworkReceiveThroughput",
          "nameSize" : "medium",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 722,
            "left" : 0,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "NetworkReceiveThroughput",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.networkReceiveThroughput",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.networkReceiveThroughput:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.rds.networkReceiveThroughput:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        },
        {
          "name" : "NetworkTransmitThroughpu",
          "nameSize" : "medium",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 722,
            "left" : 380,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "NetworkTransmitThroughpu",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.rds.networkTransmitThroughput",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
              "sortBy" : "DESC",
              "sortByDimension" : "",
              "filterBy" : {
                "nestedFilters" : [],
                "criteria" : []
              },
              "limit" : 20,
              "rate" : "NONE",
              "enabled" : true
            }
          ],
          "visualConfig" : {
            "type" : "SINGLE_VALUE",
            "global" : {},
            "rules" : [
              {
                "matcher" : "A:",
                "properties" : {
                  "color" : "DEFAULT"
                },
                "seriesOverrides" : []
              }
            ],
            "axes" : {
              "xAxis" : {
                "visible" : true
              },
              "yAxes" : []
            },
            "heatmapSettings" : {
              "yAxis" : "VALUE"
            },
            "singleValueSettings" : {
              "showTrend" : true,
              "showSparkLine" : true,
              "linkTileColorToThreshold" : true
            },
            "thresholds" : [
              {
                "axisTarget" : "LEFT",
                "rules" : [
                  {
                    "color" : "#7dc540"
                  },
                  {
                    "color" : "#f5d30f"
                  },
                  {
                    "color" : "#dc172a"
                  }
                ],
                "visible" : true
              }
            ],
            "tableSettings" : {
              "hiddenColumns" : []
            },
            "graphChartSettings" : {
              "connectNulls" : false
            },
            "honeycombSettings" : {
              "showHive" : true,
              "showLegend" : true,
              "showLabels" : false
            }
          },
          "queriesSettings" : {
            "resolution" : ""
          },
          "metricExpressions" : [
            "resolution=Inf&(ext:cloud.aws.rds.networkTransmitThroughput:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
            "resolution=null&(ext:cloud.aws.rds.networkTransmitThroughput:splitBy():sort(value(auto,descending)):limit(20))"
          ]
        }
      ]
  })
}
