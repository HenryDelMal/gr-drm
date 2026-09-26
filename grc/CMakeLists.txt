file(GLOB drm_grc_blocks CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.block.yml")
install(FILES ${drm_grc_blocks} DESTINATION share/gnuradio/grc/blocks)
