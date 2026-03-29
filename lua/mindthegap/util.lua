local M = {}

function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

function M.blend(fg, bg, alpha)
  local fr, fg_g, fb = M.hex_to_rgb(fg)
  local br, bg_g, bb = M.hex_to_rgb(bg)
  return M.rgb_to_hex(alpha * fr + (1 - alpha) * br, alpha * fg_g + (1 - alpha) * bg_g, alpha * fb + (1 - alpha) * bb)
end

function M.darken(hex, amount)
  local r, g, b = M.hex_to_rgb(hex)
  return M.rgb_to_hex(r * (1 - amount), g * (1 - amount), b * (1 - amount))
end

function M.lighten(hex, amount)
  local r, g, b = M.hex_to_rgb(hex)
  return M.rgb_to_hex(r + (255 - r) * amount, g + (255 - g) * amount, b + (255 - b) * amount)
end

return M
