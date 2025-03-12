resource "dynatrace_json_dashboard" "cosmo_dynamodb_dashboard_template" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : "dynamodb_dashboard_template",
        "shared" : true,
        "owner" : "Cosmos",
        "preset" : true,
      },
      "tiles" : [
        {
          "name" : "ConditionalCheckFailedRequests",
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
              "metric" : "ext:cloud.aws.dynamodb.ConditionalCheckFailedRequestsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.ConditionalCheckFailedRequestsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ConsumedReadCapacityUnits",
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
              "metric" : "ext:cloud.aws.dynamodb.consumedReadCapacityUnitsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.consumedReadCapacityUnitsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ConsumedWriteCapacityUnits",
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
              "metric" : "ext:cloud.aws.dynamodb.consumedWriteCapacityUnitsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.consumedWriteCapacityUnitsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ReadThrottleEvents",
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
              "metric" : "ext:cloud.aws.dynamodb.ReadThrottleEventsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.ReadThrottleEventsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ReturnedItemCount",
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
              "metric" : "ext:cloud.aws.dynamodb.returnedItemCountSumByOperation",
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
            "resolution=null&(ext:cloud.aws.dynamodb.returnedItemCountSumByOperation:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "SuccessfulRequestLatency",
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
              "metric" : "ext:cloud.aws.dynamodb.successfulRequestLatencyByOperation",
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
            "resolution=null&(ext:cloud.aws.dynamodb.successfulRequestLatencyByOperation:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "SystemErrors",
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
              "metric" : "ext:cloud.aws.dynamodb.SystemErrorsSumByOperation",
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
            "resolution=null&(ext:cloud.aws.dynamodb.SystemErrorsSumByOperation:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "ThrottledRequests",
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
              "metric" : "ext:cloud.aws.dynamodb.ThrottledRequestsSumByOperation",
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
            "resolution=null&(ext:cloud.aws.dynamodb.ThrottledRequestsSumByOperation:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "TransactionConflict",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 646,
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
              "metric" : "ext:cloud.aws.dynamodb.TransactionConflictSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.TransactionConflictSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "UserErrors",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 646,
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
              "metric" : "ext:cloud.aws.dynamodb.UserErrorsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.UserErrorsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        },
        {
          "name" : "WriteThrottleEvents",
          "tileType" : "DATA_EXPLORER",
          "configured" : true,
          "bounds" : {
            "top" : 646,
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
              "metric" : "ext:cloud.aws.dynamodb.WriteThrottleEventsSum",
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
            "resolution=null&(ext:cloud.aws.dynamodb.WriteThrottleEventsSum:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
          ]
        }
      ]
  })
}  
