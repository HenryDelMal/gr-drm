"""Disable optional Matplotlib extras for the DRM Qt example.

GNU Radio's ``qtgui`` package imports Matplotlib even when a flowgraph only
uses native Qt sinks. On affected Python 3.14/macOS installations that import
can fail during font discovery. Raising ImportError makes GNU Radio skip those
optional Matplotlib-only blocks while retaining ``qtgui.const_sink_c``.
"""

raise ImportError("Matplotlib optional Qt extras disabled for this example")
