resource "dynatrace_json_dashboard" "cosmo_s3_dashboard_template" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : "S3_dashboard_template",
        "shared" : true
        "owner" : "Cosmos",
        "preset" : true,
      },
      "tiles" : [
        {
          "name" : "BytesDownloaded",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
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
              "metric" : "ext:cloud.aws.s3.bytesDownloadedByFilterId",
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
            "resolution=null&(ext:cloud.aws.s3.bytesDownloadedByFilterId:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "BytesUploaded",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
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
              "metric" : "ext:cloud.aws.s3.bytesUploadedByFilterId",
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
            "resolution=null&(ext:cloud.aws.s3.bytesUploadedByFilterId:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "AllRequests",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
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
              "metric" : "ext:cloud.aws.s3.allRequestsSumByFilterId",
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
            "resolution=null&(ext:cloud.aws.s3.allRequestsSumByFilterId:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "4xxErrors",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 0,
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
              "metric" : "ext:cloud.aws.s3.4xxErrorsByFilterId",
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
            "resolution=null&(ext:cloud.aws.s3.\"4xxErrorsByFilterId\":splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "5xxErrors",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 304,
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
              "metric" : "ext:cloud.aws.s3.5xxErrorsByFilterId",
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
            "resolution=null&(ext:cloud.aws.s3.\"5xxErrorsByFilterId\":splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        }
      ]
  })
}  
