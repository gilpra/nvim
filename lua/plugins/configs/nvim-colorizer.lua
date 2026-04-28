require("colorizer").setup({
	"*", -- aktif di semua filetype
}, {
	RGB = true, -- #RGB
	RRGGBB = true, -- #RRGGBB
	names = false, -- "red", "blue" dll — matikan kalau terlalu noisy
	RRGGBBAA = true, -- #RRGGBBAA
	rgb_fn = true, -- rgb() dan rgba()
	hsl_fn = true, -- hsl() dan hsla()
	css = true, -- semua css color format
})
