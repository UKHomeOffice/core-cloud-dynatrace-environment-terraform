resource "dynatrace_json_dashboard" "comos_msk_dashboard_terraform" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : "MSK_dashboard_template",
        "shared" : true,
        "owner" : "Cosmos",
        "preset" : true,
      },
      "tiles" : [
        {
          "name" : "PartitionCount",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 38,
            "left" : 0,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.partitionCountByBrokerID",
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
                  "displayName" : "Y axis",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.partitionCountByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "MemoryUsed",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 38,
            "left" : 304,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.memoryUsedByBrokerID",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.memoryUsedByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "BytesInPerSec",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 38,
            "left" : 608,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.bytesInPerSecSumByBrokerIDTopic",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.bytesInPerSecSumByBrokerIDTopic:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "BytesOutPerSec",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 38,
            "left" : 912,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.bytesOutPerSecSumByBrokerIDTopic",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.bytesOutPerSecSumByBrokerIDTopic:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "CpuUser",
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
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.cpuUserSumByBrokerID",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.cpuUserSumByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "CpuSystem",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 304,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.cpuSystemSumByBrokerID",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.cpuSystemSumByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "KafkaDataLogsDiskUsed",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 608,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.kafkaAppLogsDiskUsedByBrokerID",
              "spaceAggregation" : "AUTO",
              "timeAggregation" : "DEFAULT",
              "splitBy" : [],
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.kafkaAppLogsDiskUsedByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "NetworkTxPackets",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 342,
            "left" : 912,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.networkTxPacketsByBrokerID",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.networkTxPacketsByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "NetworkRxPackets",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 38,
            "left" : 1216,
            "width" : 304,
            "height" : 304
          },
          "tileFilter" : {},
          "isAutoRefreshDisabled" : false,
          "customName" : "Data explorer results",
          "queries" : [
            {
              "id" : "A",
              "metric" : "ext:cloud.aws.kafka.networkRxPacketsByBrokerID",
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
              "yAxis" : "VALUE",
              "showLabels" : false
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
            "resolution=null&(ext:cloud.aws.kafka.networkRxPacketsByBrokerID:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        }
      ]
  })
}
