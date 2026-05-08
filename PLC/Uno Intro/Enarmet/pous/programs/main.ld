PROGRAM main
VAR
	seg_a : bool AT %QX0.0;
	seg_b : bool AT %QX0.1;
	seg_c : bool AT %QX0.2;
	seg_d : bool AT %QX0.3;
	seg_e : bool AT %QX0.4;
	seg_f : bool AT %QX0.5;
	seg_g : bool AT %QX0.6;
	BtnGreen : bool AT %IX0.0;
	counter : int;
	seg1_display : Decoder7Seg;
	resetValue : int := 9;
	presetValue : int := 10;
	resetTrigger : bool;
	CTU1 : CTU;
	TON0 : TON;
	TON_Timer : time := T#30ms;
	TON_trigger : bool;
	Seg1_trigger : bool;
END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        323,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd",
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
            "numericId": "4956247",
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
          "id": "CONTACT_274b7cc0-e8a6-4f5a-aa3f-f190107d4b20",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "9348413",
            "variable": {
              "name": "BtnGreen",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%IX0.0",
              "initialValue": null,
              "documentation": "",
              "debug": true
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_500ffada-6dd2-49e3-99d6-b9ab04633cb3",
          "type": "coil",
          "position": {
            "x": 182,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 182,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 210,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5596369",
            "variable": {
              "name": "Seg1_trigger",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": ""
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd",
          "type": "powerRail",
          "position": {
            "x": 320,
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
                "x": 320
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
            "numericId": "4804337",
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
          "id": "e_left-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd_CONTACT_274b7cc0-e8a6-4f5a-aa3f-f190107d4b20__left-rail_input",
          "source": "left-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd",
          "sourceHandle": "left-rail",
          "target": "CONTACT_274b7cc0-e8a6-4f5a-aa3f-f190107d4b20",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_274b7cc0-e8a6-4f5a-aa3f-f190107d4b20_COIL_500ffada-6dd2-49e3-99d6-b9ab04633cb3__output_input",
          "source": "CONTACT_274b7cc0-e8a6-4f5a-aa3f-f190107d4b20",
          "sourceHandle": "output",
          "target": "COIL_500ffada-6dd2-49e3-99d6-b9ab04633cb3",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_500ffada-6dd2-49e3-99d6-b9ab04633cb3_right-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd__output_right-rail",
          "source": "COIL_500ffada-6dd2-49e3-99d6-b9ab04633cb3",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_7046c52c-565b-4abb-b6f1-96efd5208ccd",
          "targetHandle": "right-rail"
        }
      ]
    },
    {
      "id": "rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        1167,
        174
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0",
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
            "numericId": "8203673",
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
          "id": "CONTACT_96132c7e-b381-497e-bd9d-2309fbcf0969",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "4079197",
            "variable": {
              "name": "Seg1_trigger",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": ""
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "CONTACT_187cc1e8-986b-409c-bcd1-6ef21a710f32",
          "type": "contact",
          "position": {
            "x": 182,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 206,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 206,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 182,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 206,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "9133446",
            "variable": {
              "name": "TON_trigger",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": ""
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
          "type": "block",
          "position": {
            "x": 371,
            "y": 14
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 371,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
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
                  "x": 371,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 437,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 437,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 371,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
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
                  "x": 371,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 437,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 437,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 371,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
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
                "x": 437,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "5607787",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON0",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "TON_Timer",
                  "type": {
                    "definition": "base-type",
                    "value": "time"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "T#500ms"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_0de904e4-97a9-4c67-a398-aa97749240ef",
          "type": "coil",
          "position": {
            "x": 602,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 602,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 630,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 602,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 630,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 602,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 630,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "9819411",
            "variable": {
              "name": "TON_trigger",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": ""
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "type": "block",
          "position": {
            "x": 795,
            "y": 14
          },
          "height": 140,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 795,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "CU",
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
                  "x": 795,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "R",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 795,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "PV",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 861,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 861,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "CV",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 795,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "CU",
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
                  "x": 795,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "R",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 795,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "PV",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 861,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 861,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "CV",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 795,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "CU",
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
                "x": 861,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "9154327",
            "variant": {
              "name": "CTU",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "CU",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "R",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "PV",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  }
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "CV",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  }
                },
                {
                  "name": "CU_T",
                  "class": "local",
                  "type": {
                    "definition": "derived-type",
                    "value": "R_TRIG"
                  }
                }
              ],
              "body": "CU_T(CU);\n        IF R THEN CV := 0;\n        ELSIF CU_T.Q AND (CV < PV) THEN CV := CV+1;\n        END_IF;\n        Q := (CV >= PV);",
              "documentation": "The up-counter can be used to signal when a count has reached a maximum value."
            },
            "variable": {
              "name": "CTU1",
              "type": {
                "definition": "derived",
                "value": "CTU"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "CV",
                "type": "output",
                "variable": {
                  "name": "counter",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "R",
                "type": "input",
                "variable": {
                  "name": "resetTrigger",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": true
                }
              },
              {
                "handleId": "PV",
                "type": "input",
                "variable": {
                  "name": "presetValue",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": "10",
                  "documentation": "",
                  "debug": true
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_c36ae23e-5f2a-4b92-a31b-e5cecb73ace7",
          "type": "coil",
          "position": {
            "x": 1026,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 1026,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 1054,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 1026,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 1054,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 1026,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 1054,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5188049",
            "variable": {
              "name": "resetTrigger",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": true
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0",
          "type": "powerRail",
          "position": {
            "x": 1164,
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
                "x": 1164
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
            "numericId": "1671385",
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
        },
        {
          "id": "VARIABLE_4fa6fcec-5fc1-43b3-a9df-ad8c80200c02",
          "type": "variable",
          "position": {
            "x": 261,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 421,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 421,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 421,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6479456",
            "variable": {
              "name": "TON_Timer",
              "type": {
                "definition": "base-type",
                "value": "time"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": "T#500ms"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c84d9587-4cb9-4c5d-a93c-3dfa5652a5aa",
          "type": "variable",
          "position": {
            "x": 467,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 467,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 467,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 467,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7254575",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_0e9bc478-0d04-4452-86b4-5665da1847f0",
          "type": "variable",
          "position": {
            "x": 685,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 845,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 845,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 845,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1858720",
            "variable": {
              "name": "resetTrigger",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": true
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
              "handleId": "R",
              "variableType": {
                "name": "R",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e618fb7f-b147-4fd0-b0bc-a9fad03aa24b",
          "type": "variable",
          "position": {
            "x": 685,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 845,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 845,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 845,
                "y": 130
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "316797",
            "variable": {
              "name": "presetValue",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": "10",
              "documentation": "",
              "debug": true
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
              "handleId": "PV",
              "variableType": {
                "name": "PV",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4660a89a-fc05-44fe-8aef-b441020cddbb",
          "type": "variable",
          "position": {
            "x": 891,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 891,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 891,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 891,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9395811",
            "variable": {
              "name": "counter",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
              "handleId": "CV",
              "variableType": {
                "name": "CV",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_COIL_0de904e4-97a9-4c67-a398-aa97749240ef_BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece__output_CU",
          "source": "COIL_0de904e4-97a9-4c67-a398-aa97749240ef",
          "sourceHandle": "output",
          "target": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "targetHandle": "CU"
        },
        {
          "id": "e_CONTACT_187cc1e8-986b-409c-bcd1-6ef21a710f32_BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee__output_IN",
          "source": "CONTACT_187cc1e8-986b-409c-bcd1-6ef21a710f32",
          "sourceHandle": "output",
          "target": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee_COIL_0de904e4-97a9-4c67-a398-aa97749240ef__Q_input",
          "source": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
          "sourceHandle": "Q",
          "target": "COIL_0de904e4-97a9-4c67-a398-aa97749240ef",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece_COIL_c36ae23e-5f2a-4b92-a31b-e5cecb73ace7__Q_input",
          "source": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "sourceHandle": "Q",
          "target": "COIL_c36ae23e-5f2a-4b92-a31b-e5cecb73ace7",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_c36ae23e-5f2a-4b92-a31b-e5cecb73ace7_right-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0__output_right-rail",
          "source": "COIL_c36ae23e-5f2a-4b92-a31b-e5cecb73ace7",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_left-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0_CONTACT_96132c7e-b381-497e-bd9d-2309fbcf0969__left-rail_input",
          "source": "left-rail-rung_main_1ad045d3-6230-47a4-93fe-61657392bcb0",
          "sourceHandle": "left-rail",
          "target": "CONTACT_96132c7e-b381-497e-bd9d-2309fbcf0969",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_96132c7e-b381-497e-bd9d-2309fbcf0969_CONTACT_187cc1e8-986b-409c-bcd1-6ef21a710f32__output_input",
          "source": "CONTACT_96132c7e-b381-497e-bd9d-2309fbcf0969",
          "sourceHandle": "output",
          "target": "CONTACT_187cc1e8-986b-409c-bcd1-6ef21a710f32",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_4fa6fcec-5fc1-43b3-a9df-ad8c80200c02_BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee__output_PT",
          "source": "VARIABLE_4fa6fcec-5fc1-43b3-a9df-ad8c80200c02",
          "sourceHandle": "output",
          "target": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee_VARIABLE_c84d9587-4cb9-4c5d-a93c-3dfa5652a5aa__ET_input",
          "source": "BLOCK_bdaff40c-f532-422e-b2e2-f0e6e40c30ee",
          "sourceHandle": "ET",
          "target": "VARIABLE_c84d9587-4cb9-4c5d-a93c-3dfa5652a5aa",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_0e9bc478-0d04-4452-86b4-5665da1847f0_BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece__output_R",
          "source": "VARIABLE_0e9bc478-0d04-4452-86b4-5665da1847f0",
          "sourceHandle": "output",
          "target": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "targetHandle": "R"
        },
        {
          "id": "e_VARIABLE_e618fb7f-b147-4fd0-b0bc-a9fad03aa24b_BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece__output_PV",
          "source": "VARIABLE_e618fb7f-b147-4fd0-b0bc-a9fad03aa24b",
          "sourceHandle": "output",
          "target": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "targetHandle": "PV"
        },
        {
          "id": "e_BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece_VARIABLE_4660a89a-fc05-44fe-8aef-b441020cddbb__CV_input",
          "source": "BLOCK_d3ef5ca0-f0c4-4d6b-b504-73af267e1ece",
          "sourceHandle": "CV",
          "target": "VARIABLE_4660a89a-fc05-44fe-8aef-b441020cddbb",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        556,
        374
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365",
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
            "numericId": "4234599",
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
          "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "height": 340,
          "width": 150,
          "measured": {
            "width": 150,
            "height": 340
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
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "InputTal",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
              {
                "glbPosition": {
                  "x": 293,
                  "y": 90
                },
                "relPosition": {
                  "x": 150,
                  "y": 76
                },
                "id": "a",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "b",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 170
                },
                "relPosition": {
                  "x": 150,
                  "y": 156
                },
                "id": "c",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 210
                },
                "relPosition": {
                  "x": 150,
                  "y": 196
                },
                "id": "d",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 250
                },
                "relPosition": {
                  "x": 150,
                  "y": 236
                },
                "id": "e",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 290
                },
                "relPosition": {
                  "x": 150,
                  "y": 276
                },
                "id": "f",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 330
                },
                "relPosition": {
                  "x": 150,
                  "y": 316
                },
                "id": "g",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
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
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "InputTal",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 293,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
              {
                "glbPosition": {
                  "x": 293,
                  "y": 90
                },
                "relPosition": {
                  "x": 150,
                  "y": 76
                },
                "id": "a",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "b",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 170
                },
                "relPosition": {
                  "x": 150,
                  "y": 156
                },
                "id": "c",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 210
                },
                "relPosition": {
                  "x": 150,
                  "y": 196
                },
                "id": "d",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 250
                },
                "relPosition": {
                  "x": 150,
                  "y": 236
                },
                "id": "e",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 290
                },
                "relPosition": {
                  "x": 150,
                  "y": 276
                },
                "id": "f",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 293,
                  "y": 330
                },
                "relPosition": {
                  "x": 150,
                  "y": 316
                },
                "id": "g",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
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
                "x": 293,
                "y": 50
              },
              "relPosition": {
                "x": 150,
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
            "numericId": "2066650",
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
                },
                {
                  "name": "InputTal",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  }
                },
                {
                  "name": "a",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "b",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "c",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "d",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "e",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "f",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "g",
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
              "name": "seg1_display",
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
            "connectedVariables": [
              {
                "handleId": "a",
                "type": "output",
                "variable": {
                  "name": "seg_a",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.0",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "b",
                "type": "output",
                "variable": {
                  "name": "seg_b",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.1",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "c",
                "type": "output",
                "variable": {
                  "name": "seg_c",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.2",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "d",
                "type": "output",
                "variable": {
                  "name": "seg_d",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.3",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "e",
                "type": "output",
                "variable": {
                  "name": "seg_e",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.4",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "f",
                "type": "output",
                "variable": {
                  "name": "seg_f",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.5",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "g",
                "type": "output",
                "variable": {
                  "name": "seg_g",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "%QX0.6",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "InputTal",
                "type": "input",
                "variable": {
                  "name": "counter",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365",
          "type": "powerRail",
          "position": {
            "x": 553,
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
                "x": 553
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
            "numericId": "2023914",
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
        },
        {
          "id": "VARIABLE_f8674d63-0640-4378-8d33-af3dee7a6531",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "2497491",
            "variable": {
              "name": "counter",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_f8674d63-0640-4378-8d33-af3dee7a6531"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "InputTal",
              "variableType": {
                "name": "InputTal",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_88df5656-8121-4ed2-8767-141bcfffd3f1",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5987392",
            "variable": {
              "name": "seg_a",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.0",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_88df5656-8121-4ed2-8767-141bcfffd3f1"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "a",
              "variableType": {
                "name": "a",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_8740f5da-a6cd-4cbd-ad80-24ae73d71f0e",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "934531",
            "variable": {
              "name": "seg_b",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.1",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_8740f5da-a6cd-4cbd-ad80-24ae73d71f0e"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "b",
              "variableType": {
                "name": "b",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_8eb87690-241f-4d9a-9bd1-d097ea857b3f",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 154
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 170
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7033223",
            "variable": {
              "name": "seg_c",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.2",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_8eb87690-241f-4d9a-9bd1-d097ea857b3f"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "c",
              "variableType": {
                "name": "c",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_44fc15f2-1336-4475-9c5a-73af1cabff45",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 194
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 210
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9710132",
            "variable": {
              "name": "seg_d",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.3",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_44fc15f2-1336-4475-9c5a-73af1cabff45"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "d",
              "variableType": {
                "name": "d",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_68e816a7-6dc9-4565-ae78-afeb12f24e82",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 234
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 250
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "4327067",
            "variable": {
              "name": "seg_e",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.4",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_68e816a7-6dc9-4565-ae78-afeb12f24e82"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "e",
              "variableType": {
                "name": "e",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_61f3bcbb-80de-4d05-8123-da1ed17e22e1",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 274
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 290
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1121290",
            "variable": {
              "name": "seg_f",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.5",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_61f3bcbb-80de-4d05-8123-da1ed17e22e1"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "f",
              "variableType": {
                "name": "f",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_35cd43ae-a007-44cf-9107-d5178438f177",
          "type": "variable",
          "position": {
            "x": 323,
            "y": 314
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 330
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3235636",
            "variable": {
              "name": "seg_g",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.6",
              "initialValue": null,
              "documentation": "",
              "debug": true,
              "id": "broken-VARIABLE_35cd43ae-a007-44cf-9107-d5178438f177"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
              "handleId": "g",
              "variableType": {
                "name": "g",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1__left-rail_EN",
          "source": "left-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365",
          "sourceHandle": "left-rail",
          "target": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_right-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365__ENO_right-rail",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_9b3d7b67-df55-4507-9563-5389c2bc6365",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_f8674d63-0640-4378-8d33-af3dee7a6531_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1__output_InputTal",
          "source": "VARIABLE_f8674d63-0640-4378-8d33-af3dee7a6531",
          "sourceHandle": "output",
          "target": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "targetHandle": "InputTal"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_88df5656-8121-4ed2-8767-141bcfffd3f1__a_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "a",
          "target": "VARIABLE_88df5656-8121-4ed2-8767-141bcfffd3f1",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_8740f5da-a6cd-4cbd-ad80-24ae73d71f0e__b_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "b",
          "target": "VARIABLE_8740f5da-a6cd-4cbd-ad80-24ae73d71f0e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_8eb87690-241f-4d9a-9bd1-d097ea857b3f__c_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "c",
          "target": "VARIABLE_8eb87690-241f-4d9a-9bd1-d097ea857b3f",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_44fc15f2-1336-4475-9c5a-73af1cabff45__d_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "d",
          "target": "VARIABLE_44fc15f2-1336-4475-9c5a-73af1cabff45",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_68e816a7-6dc9-4565-ae78-afeb12f24e82__e_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "e",
          "target": "VARIABLE_68e816a7-6dc9-4565-ae78-afeb12f24e82",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_61f3bcbb-80de-4d05-8123-da1ed17e22e1__f_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "f",
          "target": "VARIABLE_61f3bcbb-80de-4d05-8123-da1ed17e22e1",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1_VARIABLE_35cd43ae-a007-44cf-9107-d5178438f177__g_input",
          "source": "BLOCK_07950287-e6b0-4a48-9b34-90fab3700ba1",
          "sourceHandle": "g",
          "target": "VARIABLE_35cd43ae-a007-44cf-9107-d5178438f177",
          "targetHandle": "input"
        }
      ]
    }
  ]
}
END_PROGRAM