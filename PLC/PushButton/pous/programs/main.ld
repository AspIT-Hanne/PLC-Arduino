PROGRAM main
VAR
	BtnGreen : bool AT %IX0.0;
	LEDGreen : bool;
	DECODER7SEG0 : Decoder7Seg;
END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        538,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "6201098",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_7734536a-e9ca-45af-ad4b-08b515c5259c",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "height": 60,
          "width": 132,
          "measured": {
            "width": 132,
            "height": 60
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 275,
                  "y": 50
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 275,
                  "y": 50
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 143,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 275,
                "y": 50
              },
              "relPosition": {
                "x": 132,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "3978501",
            "variant": {
              "name": "Decoder7Seg",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "DECODER7SEG0",
              "type": {
                "definition": "derived",
                "value": "Decoder7Seg"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1",
          "type": "powerRail",
          "position": {
            "x": 535,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 535
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "1600168",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1_BLOCK_7734536a-e9ca-45af-ad4b-08b515c5259c__left-rail_EN",
          "source": "left-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1",
          "sourceHandle": "left-rail",
          "target": "BLOCK_7734536a-e9ca-45af-ad4b-08b515c5259c",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_7734536a-e9ca-45af-ad4b-08b515c5259c_right-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1__ENO_right-rail",
          "source": "BLOCK_7734536a-e9ca-45af-ad4b-08b515c5259c",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_c58357b7-9c80-4dc9-9da6-9593bcb15bc1",
          "targetHandle": "right-rail"
        }
      ]
    }
  ]
}
END_PROGRAM