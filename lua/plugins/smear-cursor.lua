return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    stiffness = 0.55,
    trailing_stiffness = 0.3,
    damping = 1.0,
    smear_insert_mode = true,
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    distance_stop_animating = 0.2,
	cursor_coror = "#ffffff",
  }
}
