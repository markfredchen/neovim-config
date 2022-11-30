local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "none",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        separator = false,
      }
    }
  }
})
